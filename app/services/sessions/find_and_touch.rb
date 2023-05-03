# frozen_string_literal: true

# Finds the non-expired session by the given token and touches its last activity.
class Sessions::FindAndTouch
  QUERY = <<~SQL
    SELECT *
    FROM sessions
    WHERE id = :id
  SQL

  def call(token:)
    return nil if token.blank?

    Session.find_by_sql([QUERY, { id: token }]).first
  rescue ActiveRecord::StatementInvalid
    # Handling of badly formed tokens
    nil
  end
end
