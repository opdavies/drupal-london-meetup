<?php

declare(strict_types=1);

namespace Drupal\opdavies_talks\Controller;

use Drupal\Core\StringTranslation\StringTranslationTrait;

final class TalksPageController {

  use StringTranslationTrait;

  public function __invoke(): array {
    $talkCount = 2;

    return ['#markup' => $this->t('<span data-talk-count>:count talks</span>', [':count' => $talkCount])];
  }

}
