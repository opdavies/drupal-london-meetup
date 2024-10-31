{ pkgs, ... }:

let
  drupalRoot = "web";
in
{
  packages = [
    pkgs.git
  ];

  dotenv.disableHint = true;

  languages = {
    php = {
      enable = true;
      version = "8.2";

      ini = ''
        memory_limit = 256M
      '';

      fpm.pools.web = {
        listen = "127.0.0.1:9000";

        settings = {
          "pm" = "dynamic";
          "pm.max_children" = 75;
          "pm.max_requests" = 500;
          "pm.max_spare_servers" = 20;
          "pm.min_spare_servers" = 5;
          "pm.start_servers" = 10;
        };
      };
    };
  };

  processes = { };

  services = {
    caddy = {
      enable = true;

      config = ''
        {
          http_port 8080
        }

        localhost:8080 {
          root * ${drupalRoot}
          encode gzip
          php_fastcgi localhost:9000
          file_server
        }
      '';
    };

    mysql = {
      enable = true;
      initialDatabases = [ { name = "app"; } ];
    };
  };

  enterShell = ''
    if [[ ! -d vendor ]]; then
      composer install
    fi
  '';

  enterTest = ''
    phpunit --testdox
  '';
}
