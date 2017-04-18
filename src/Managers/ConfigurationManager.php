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

namespace BlazingThreads\CliPress\Managers;

class ConfigurationManager
{
    /** @var array */
    protected $configuration;

    /**
     * ConfigurationManager constructor.
     */
    public function __construct()
    {
        $configuration = @file_get_contents($this->getConfigurationFile());
        if (empty($configuration)) {
            $configuration = '{}';
        }

        $this->configuration = json_decode($configuration, true);
    }

    /**
     * @param $key
     * @param null $default
     * @return mixed|null
     */
    public function get($key, $default = null)
    {
        return $this->has($key) ? $this->configuration[$key] : $default;
    }

    /**
     * @param $key
     * @return bool
     */
    public function has($key)
    {
        return key_exists($key, $this->configuration);
    }

    /**
     * @return int
     */
    public function saveConfiguration()
    {
        return file_put_contents($this->getConfigurationFile(), json_encode($this->configuration, JSON_PRETTY_PRINT));
    }

    /**
     * @param $configuration
     */
    public function setConfiguration($configuration)
    {
        $this->configuration = $configuration;
    }

    /**
     * @param $key
     * @param $value
     */
    public function set($key, $value)
    {
        $this->configuration[$key] = $value;
    }

    /**
     * @return string
     */
    protected function getConfigurationFile()
    {
        return app()->path('config') . '/configuration.json';
    }

}