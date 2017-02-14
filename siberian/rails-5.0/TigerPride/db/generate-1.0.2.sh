#!/bin/bash

state="state:integer status:string details:text auxillary:text"
$unique="string:uniq private_key:string:index"
desc="name:string description:text"

unique() {
    echo "$1 $1:string:uniq private_key:string:index"
}

rails g model `unique queued_user` name:string email:string salt:string iterations:integer

rails g model `unique person` added_by:references:index gender:string $state
rails g model other_name name:string:index
rails g model one_name name:string:index uses:integer
rails g model name_prefix name:string abbreviation:string
rails g model name_suffix name:string abbreviation:string
rails g model three_name title:string given:string:index middle:string family:string:index suffix:string name:string:index
rails g model `unique monicker` person:references:index name:references{polymorphic}:index added_by:references:index kind:string primary:boolean
rails g model email person:references:index added_by:references:index address:string:index provider:string:index kind:string primary:boolean
rails g model other_address address:text
rails g model usa_address name:string:index number:string street:string:index apartment:string city:string:index state:string:index zipcode:integer:index extension:integer
rails g model `unique residence` person:references:index address:references{polymorphic}:index added_by:references:index kind:string primary:boolean
rails g model phone person:references:index added_by:references:index number:string:index provider:string:index kind:string primary:boolean
rails g model language person:references:index added_by:references:index language:string:index kind:string primary:boolean

rails g model relationship_type name:string parent:string inverse:string
rails g model relationship person_a:references:index person_b:references:index kind:string added_by:references:index

rails g model `unique user` person:references:index name:string:uniq reg_date:integer reg_ip:integer log_dat:integer log_ip:integer $state
rails g model `unique account` user:references:index $desc display:string
rails g model `unique credential` account:references:index perm_override_add:bigint perm_override_remove:bigint perm_override:text
rails g model `unique login` account:references:index email:references:index client_salt:string server_salt:string iterations:integer passhash:string version:string primary:boolean
rails g model `unique auto_login` login:references:index public_key:string private_key:string date:integer ip:integer

rails g model `unique permission_set` permissions:integer
rails g model permission permission_set:references:index $desc kind:string visibility:string key:string
rails g model `unique organization` parent:references:index permission_set:references:index added_by:references:index $desc $state
rails g model `unique member` account:references:index organization:references:index authorized_by:references:index $state

rails g model `unique group` organization:references:index added_by:references:index $desc precedence:integer perm_add:bigint perm_remove:bigint perm:text $state
rails g model `unique assignment` account:references:index group:references:index authorized_by:references:index $state
rails g model forced_group_email group:references:index regex:string details:text
rails g model forced_group_ip group:references:index kind:integer low:integer high:integer details:text

rails g model `unique role` organization:references:index added_by:references:index $desc precedence:integer $state
rails g model `unique appointment` account:references:index role:references:index authorized_by:references:index $state
rails g model operation $desc parent:references:index
rails g model right role:references:index permission:references:index kind:string

rails g model group_priveledge owner:references:index target:references:index added_by:references:index
rails g model role_priveledge owner:references:index target:references:index added_by:references:index