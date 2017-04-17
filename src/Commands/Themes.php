<?php

/*
 * This file is part of CLI Press.
 *
 * The MIT License (MIT)
 * Copyright © 2017
 *
 * Alex Carter, alex@blazeworx.com
 * Keith E. Freeman, cli-press@forsaken-threads.com
 *
 * For the full copyright and license information, please view the LICENSE
 * file that should have been distributed with this source code.
 */

namespace BlazingThreads\CliPress\Commands;

class Themes extends BaseCommand
{

    /**
     * @inheritdoc
     */
    protected function configure()
    {
        $this
            ->setName('themes')
            ->setDescription('Show a list of available themes');
    }

    /**
     * @inheritdoc
     */
    protected function exec()
    {
        $list = "Available Themes\n";
        $list .= "<info>built-in:</info>\n";
        foreach (glob(app()->path('themes.builtin', '*'), GLOB_ONLYDIR) as $theme) {
            $theme = basename($theme);
            if ($theme == 'cli-press') {
                $theme = 'cli-press (base)';
            }
            $list .= "<comment>$theme</comment>\n";
        }
        $this->output->write($list);
    }
}
