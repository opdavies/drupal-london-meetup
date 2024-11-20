<?php

namespace Drupal\Tests\opdavies_talks\Functional;

use Drupal\Tests\BrowserTestBase;
use Symfony\Component\HttpFoundation\Response;

class TalksPageTest extends BrowserTestBase {

  public $defaultTheme = 'stark';

  public static $modules = ['node', 'opdavies_talks'];

  public function test_it_returns_a_200_response_code(): void {
    $this->drupalGet('/talks');

    $session = $this->assertSession();
    $session->statusCodeEquals(Response::HTTP_OK);
  }

  public function test_it_displays_the_talk_count(): void {
    $this->drupalGet('/talks');

    $session = $this->assertSession();
    $session->responseContains('<span data-talk-count>2 talks</span>');
  }

}
