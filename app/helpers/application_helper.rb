module ApplicationHelper
  def split_path(path)
    ar_path = path.split("/")
    model = ar_path[1]
    action = ar_path[2] rescue nil
    id = ar_path[3] rescue nil
    @path = {:model => model,:action => action,:id => id}

    return @path
  end

=begin
  def create_sql_view(path)
    self.connection.execute %Q( CREATE OR REPLACE VIEW report_state_popularities AS
              SELECT
                  MAX(M.id) AS id,
                  UPPER(A.state) AS state,
                  country,
                  COUNT(M.id) AS popularity
                FROM submitted_requests M INNER JOIN addresses A ON
                  M.address_id = A.id
                WHERE A.state != ''
                GROUP BY UPPER(A.state), country
                ORDER BY popularity DESC;
              )
        end

  end
=end

end
