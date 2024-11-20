<?php

declare(strict_types=1);

namespace Drupal\opdavies_talks\Controller;

use Drupal\Core\StringTranslation\StringTranslationTrait;
use Drupal\opdavies_talks\Repository\TalkNodeRepository;

final class TalksPageController {

  use StringTranslationTrait;

  public function __construct(private TalkNodeRepository $talkRepository) {
  }

  public function __invoke(): array {
    $talkCount = $this->talkRepository->getCount();

    return ['#markup' => $this->t('<span data-talk-count>:count talks</span>', [':count' => $talkCount])];
  }

}
