WITH base AS (
  SELECT
    *
  FROM `nfl-data-467519.espn_pull.team1`
),

unnested AS (
  SELECT
    item.fullName AS player_name,
    item.id AS player_id,
    item.jersey AS jersey_number,
    item.position.displayName AS position,
    item.position.abbreviation AS position_abbr,
    item.team.id AS team_id,
    item.team.abbreviation AS team_abbr,
    item.team.displayName AS team_name,
    item.team.location AS team_location,
    item.headshot.href AS headshot_url,
    item.age AS age,
    item.height AS height,
    item.weight AS weight,
    item.college AS college,
    item.experience.years AS experience_years
  FROM base,
    UNNEST(base.items) AS item
)

SELECT * FROM unnested
