require "jekyll-import";
JekyllImport::Importers::WordPress.run({
  "dbname"   => "szymonmo_wp1",
  "user"     => "szymonmo_wp1",
  "password" => "zxcasdqwe123",
  "host"     => "138.201.198.96",
  "port"     => "3306",
  "socket"   => "",
  "table_prefix"   => "wp_",
  "site_prefix"    => "",
  "clean_entities" => true,
  "comments"       => true,
  "categories"     => true,
  "tags"           => true,
  "more_excerpt"   => true,
  "more_anchor"    => true,
  "extension"      => "html",
  "status"         => ["publish"]
})