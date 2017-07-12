<?php

return array(
    // In PHP 5.4+, PsySH will default to your `cli.pager` ini setting. If this
    // is not set, it falls back to `less`. It is recommended that you set up
    // `cli.pager` in your `php.ini` with your preferred output pager.
    // 
    // If you are running PHP 5.3, or if you want to use a different pager only
    // for Psy shell sessions, you can override it here.
    'pager' => 'less',

    // Sets the maximum number of entries the history can contain.
    // If set to zero, the history size is unlimited.
    'historySize' => 0,

    // If set to true, the history will not keep duplicate entries.
    // Newest entries override oldest.
    // This is the equivalent of the HISTCONTROL=erasedups setting in bash.
    'eraseDuplicates' => true,

    // By default, PsySH will use a 'forking' execution loop if pcntl is
    // installed. This is by far the best way to use it, but you can override
    // the default by explicitly enabling or disabling this functionality here.
    'usePcntl' => true,

    // PsySH uses readline if you have it installed, because interactive input
    // is pretty awful without it. But you can explicitly disable it if you hate
    // yourself or something.
    'useReadline' => true,

    // PsySH automatically inserts semicolons at the end of input if a statement
    // is missing one. To disable this, set `requireSemicolons` to true.
    'requireSemicolons' => false,

    // PsySH uses a couple of UTF-8 characters in its own output. These can be
    // disabled, mostly to work around code page issues. Because Windows.
    //
    // Note that this does not disable Unicode output in general, it just makes
    // it so PsySH won't output any itself.
    'useUnicode' => true,

    // While PsySH respects the current `error_reporting` level, and doesn't throw
    // exceptions for all errors, it does log all errors regardless of level. Set
    // `errorLoggingLevel` to 0 to prevent logging non-thrown errors. Set it to any
    // valid `error_reporting` value to log only errors which match that level.
    'errorLoggingLevel' => E_ALL & ~E_NOTICE,

    // "Default includes" will be included once at the beginning of every PsySH
    // session. This is a good place to add autoloaders for your favorite
    // libraries.
    'defaultIncludes' => array(
        __DIR__ . '/../vendor/composer/autoload.php',
    ),

    // You can disable tab completion if you want to. Not sure why you'd want to.
    'tabCompletion' => true,

    'warnOnMultipleConfigs' => true,

    // By default, output contains colors if support for them is detected. To override:
    'colorMode' => \Psy\Configuration::COLOR_MODE_FORCED,   // force colors in output
);
