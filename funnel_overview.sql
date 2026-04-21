WITH user_funnel AS (
  WITH funnel_events AS (
    SELECT
      user_pseudo_id,
      event_name
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  )
  SELECT
    user_pseudo_id,

    MAX(CASE WHEN event_name = 'session_start' THEN 1 ELSE 0 END) AS session,
    MAX(CASE WHEN event_name = 'view_item' THEN 1 ELSE 0 END) AS view_item,
    MAX(CASE WHEN event_name = 'add_to_cart' THEN 1 ELSE 0 END) AS add_to_cart,
    MAX(CASE WHEN event_name = 'begin_checkout' THEN 1 ELSE 0 END) AS checkout,
    MAX(CASE WHEN event_name = 'purchase' THEN 1 ELSE 0 END) AS purchase

  FROM funnel_events
  GROUP BY user_pseudo_id
)
SELECT
  ROUND(SUM(view_item) * 100.0 / SUM(session), 2) AS view_rate,
  ROUND(SUM(add_to_cart) * 100.0 / SUM(view_item), 2) AS cart_rate,
  ROUND(SUM(checkout) * 100.0 / SUM(add_to_cart), 2) AS checkout_rate,
  ROUND(SUM(purchase) * 100.0 / SUM(checkout), 2) AS purchase_rate
FROM user_funnel;
