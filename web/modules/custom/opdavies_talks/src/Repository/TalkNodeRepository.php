<?php

declare(strict_types=1);

namespace Drupal\opdavies_talks\Repository;

use Drupal\Core\Entity\EntityTypeManagerInterface;

final class TalkNodeRepository {

  public function __construct(private EntityTypeManagerInterface $entityTypeManager) {
  }

  public function getCount(): int {
    $talks = $this->entityTypeManager->getStorage('node')->loadByProperties();

    return count($talks);
  }

}
