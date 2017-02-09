#!/bin/bash

state="state:integer status:string details:text auxillary:text"
$unique="string:uniq private_key:string:index"
desc="name:string description:text"

rails g model queued_user name:string email:string salt:string iterations:integer

rails g model person person:$unique gender:string $state_fields
rails g model one_name name:string:index
rails g model name_prefix name:string abbreviation:string
rails g model name_suffix name:string abbreviation:string
rails g model three_name title:string given:string:index middle:string family:string:index suffix:string name:string:index
rails g model monicker person:references:index monicker:$unique name:references{polymorphic}:index kind:string primary:boolean
rails g model email person:references:index address:string:index provider:string:index kind:string primary:boolean
rails g model other_address address:text
rails g model usa_address name:string:index number:string street:string:index apartment:string city:string:index state:string:index zipcode:integer:index extension:integer
rails g model residence person:references:index residence:$unique address:references{polymorphic}:index kind:string primary:boolean
rails g model phone person:references:index number:string:index provider:string:index kind:string primary:boolean
rails g model language person:references:index language:string:index kind:string primary:boolean

rails g model relationship_type name:string inverse:string
rails g model relationship person_a:references:index person_b:references:index kind:string

rails g model user person:references:index user:$unique name:string:uniq email:string:uniq client_salt:string server_salt:string iterations:integer passhash:string perm_override_add:bigint perm_override_remove:bigint perm_override:text reg_date:integer reg_ip:integer log_dat:integer log_ip:integer $state_fields
rails g model auto_login public_key:string private_key:string date:integer ip:integer

rails g model permission_set permission_set:string:$unique permissions:integer
rails g model permission permission_set:references:index $desc kind:string visibility:string key:string
rails g model organization permission_set:references:index organization:$unique $desc $state
rails g model member user:references:index organization:references:index member:$unique $state

rails g model group organization:references:index group:$unique $desc precedence:integer perm_add:bigint perm_remove:bigint perm:text $state
rails g model assignment user:references:index group:references:index assignment:$unique $state
rails g model forced_group_email group:references:index regex:string details:text
rails g model forced_group_ip group:references:index kind:integer low:integer high:integer details:text

rails g model role organization:references:index role:$unique $desc precedence:integer $state
rails g model appointment user:references:index role:references:index appointment:$unique $state
rails g model operation name:string description:text parent:references:index
rails g model right role:references:index permission:references:index kind:string

rails g model group_priveledge owner:references:index target:references:index
rails g model role_priveledge owner:references:index target:references:index