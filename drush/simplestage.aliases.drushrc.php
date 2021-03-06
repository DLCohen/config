<?php
$local_dump_dir = (is_dir('/Users/kkedrovsky')) ? '/Users/kkedrovsky/drush-dump-dir' : '/home/karl/drush-dump-dir';
$aliases['local'] = array(
  'uri' => 'simplestage',
  'root' => '/Users/kkedrovsky/workspace/simplestage/htdocs',
  'dump-dir' => $local_dump_dir,
  'path-aliases' => array(
    '%files' => 'sites/default/files',
  ),
);
$aliases['dev'] = array(
  'uri' => 'simplestage.vmldev.com',
  'root' => '/var/www/vhosts/vml/simplestage.vml.com/htdocs',
  'dump-dir' => '/home/local/VML/kkedrovsky/drush-dump-dir',
  'remote-host' => 'simplestage.vmldev.com',
  'remote-user' => 'kkedrovsky',
  'path-aliases' => array(
    '%files' => 'sites/default/files',
  ),
);
