#!/bin/bash

rails g model queued_user name:string email:string salt:string iterations:integer
rails g model person
rails g model one_name name:string:index
rails g model three_name title:string given:string:index middle:string family:string:index suffix:string
rails g model monicker person:references:index name:references{polymorphic}:index kind:string primary:boolean
rails g model email person:references:index address:string:index provider:string:index kind:string primary:boolean
rails g model other_address address:text
rails g model usa_address name:string:index number:string street:string:index apartment:string city:string:index state:string:index zipcode:integer:index extension:integer
rails g model residence person:references:index address:references{polymorphic}:index kind:string primary:boolean
rails g model phone person:references:index number:string:index provider:string:index kind:string primary:boolean
rails g model user person:references:index name:string:uniq email:string:uniq client_salt:string server_salt:string iterations:integer passhash:string perm_override_add:bigint perm_override_remove:bigint perm_override:text reg_date:integer reg_ip:integer log_dat:integer log_ip:integer state:integer status:string details:text auxillary:text
rails g model auto_login public_key:string private_key:string date:integer ip:integer
rails g model organization 
rails g model member user:references:index organization:references:index
rails g model group organization:references:index name:string description:text precedence:integer perm_add:bigint perm_remove:bigint perm:text
rails g model assignment user:references:index group:references:index
rails g model forced_group_email group:references:index regex:string details:text
rails g model forced_group_ip group:references:index low:integer high:integer details:text
rails g model role organization:references:index name:string description:text precedence:integer
rails g model appointment user:references:index role:references:index
rails g model permission name:string description:text parent:references:index
rails g model right role:references:index permission:references:index