# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_TigerPride_session'
ActionDispatch::Session::ActiveRecordStore.session_class = ActiveRecord::SessionStore::SqlBypass