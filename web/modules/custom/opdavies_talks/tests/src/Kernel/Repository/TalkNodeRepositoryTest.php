<?php

namespace Drupal\Tests\opdavies_talks\Kernel\Repository;

use Drupal\KernelTests\Core\Entity\EntityKernelTestBase;
use Drupal\opdavies_talks\Repository\TalkNodeRepository;

final class TalkNodeRepositoryTest extends EntityKernelTestBase {

  protected static $modules = ['opdavies_talks'];

  public function test_it_returns_a_count(): void {
    $talkRepository = $this->container->get(TalkNodeRepository::class);

    self::assertSame(2, $talkRepository->getCount());
  }

}
