require("luasnip.session.snippet_collection").clear_snippets("php")
require("luasnip.session.snippet_collection").clear_snippets("yaml")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("php", {
  s(
    "createnodes",
    fmt(
      [[
        $this->createNode(['type' => 'talk']);
        $this->createNode(['type' => 'talk']);
      ]],
      {}
    )
  ),

  s(
    "pagecontroller",
    fmta(
      [[
        <<?php

        declare(strict_types=1);

        namespace Drupal\opdavies_talks\Controller;

        final class TalksPageController {

          public function __invoke(): array {
            return [];
          }

        }
        ]],
      {}
    )
  ),

  s(
    "repocount",
    fmt(
      [[
        public function __construct(private EntityTypeManagerInterface $entityTypeManager) {{
        }}

        public function getCount(): int {{
          $talks = $this->entityTypeManager->getStorage('node')->loadByProperties();

          return count($talks);
        }}
      ]],
      {}
    )
  ),

  s(
    "repotestclass",
    fmta(
      [[
      <<?php

      namespace Drupal\Tests\opdavies_talks\Kernel\Repository;

      use Drupal\KernelTests\Core\Entity\EntityKernelTestBase;

      final class TalkNodeRepositoryTest extends EntityKernelTestBase {

        protected static $modules = ['opdavies_talks'];

      }
      ]],
      {}
    )
  ),

  s(
    "repotestcount",
    fmt(
      [[
        public function test_it_returns_a_count(): void {{
          $talkRepository = $this->container->get(TalkNodeRepository::class);

          self::assertSame(2, $talkRepository->getCount());
        }}
      ]],
      {}
    )
  ),

  s(
    "showconstructor",
    fmta(
      [[
      public function __construct(private TalkNodeRepository $talkRepository) {
      }
      ]],
      {}
    )
  ),

  s(
    "showcount",
    fmt(
      [[
        $talkCount = 2;

        return ['#markup' => $this->t('<span data-talk-count>:count talks</span>', [':count' => $talkCount])];
      ]],
      {}
    )
  ),

  s("showrepository", t("$talkCount = $this->talkRepository->getCount();")),

  s(
    "test200response",
    fmt(
      [[
        public function test_it_returns_a_200_response_code(): void {{
          $this->drupalGet('/talks');

          $session = $this->assertSession();
          $session->statusCodeEquals(Response::HTTP_OK);
        }}
      ]],
      {}
    )
  ),

  s(
    "testclass",
    fmt(
      [[
        <?php

        namespace Drupal\Tests\opdavies_talks\Functional;

        use Drupal\Tests\BrowserTestBase;

        class TalksPageTest extends BrowserTestBase {{

          public $defaultTheme = 'stark';

        }}
        ]],
      {}
    )
  ),

  s(
    "testcount",
    fmt(
      [[
        public function test_it_displays_the_talk_count(): void {{
          $this->drupalGet('/talks');

          $session = $this->assertSession();
          $session->responseContains('<span data-talk-count>2 talks</span>');
        }}
      ]],
      {}
    )
  ),

  s("testmodules", t("protected static $modules = ['opdavies_talks'];")),
})

ls.add_snippets("yaml", {
  s(
    "talkpage",
    fmt(
      [[
        opdavies_talks.page:
          path: /talks
          defaults:
            _controller: Drupal\opdavies_talks\Controller\TalksPageController
            _title: Talks
          requirements:
            _permission: access content
      ]],
      {}
    )
  ),

  s(
    "talkservices",
    fmt(
      [[
        services:
          Drupal\opdavies_talks\Controller\TalksPageController:
            autowire: true
          Drupal\opdavies_talks\Repository\TalkNodeRepository: []
      ]],
      {}
    )
  ),
})
