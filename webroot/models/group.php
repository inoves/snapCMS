<?php
class Group extends ActiveRecord {

  protected $columns = array('id', 'name');
  protected $table_name = 'groups';
  protected $table_vanity_name = 'groups';
  protected $primary_key = 'id';

  static function find($id, $options=null) {
    return parent::find(__CLASS__, $id, $options);
  }

}
?>
