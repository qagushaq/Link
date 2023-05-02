# frozen_string_literal: true

Rails.application.config.action_dispatch.cookies_same_site_protection = :strict
Rails.application.config.session_store :cookie_store, key: '_template_session', domain: :all
