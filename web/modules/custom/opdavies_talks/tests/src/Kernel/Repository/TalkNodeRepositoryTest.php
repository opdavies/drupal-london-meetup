<?php

namespace Drupal\Tests\opdavies_talks\Kernel\Repository;

use Drupal\KernelTests\Core\Entity\EntityKernelTestBase;
use Drupal\Tests\node\Traits\NodeCreationTrait;
use Drupal\opdavies_talks\Repository\TalkNodeRepository;

final class TalkNodeRepositoryTest extends EntityKernelTestBase {

  protected static $modules = ['node', 'opdavies_talks'];

  use NodeCreationTrait;

  public function test_it_returns_a_count(): void {
    $this->createNode(['type' => 'talk']);
    $this->createNode(['type' => 'talk']);

    $talkRepository = $this->container->get(TalkNodeRepository::class);

    self::assertSame(2, $talkRepository->getCount());
  }

}
