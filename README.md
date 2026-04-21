# Product Funnel & Retention Analysis (GA4 E-commerce)

## Objective
Analyze user behavior across the product funnel to identify key drop-off points and recommend strategies to improve conversion rates.

## Dataset
Google Analytics 4 (GA4) Public E-commerce Dataset (BigQuery)

## Approach
- Defined user funnel: Session → View Item → Add to Cart → Checkout → Purchase
- Aggregated event-level data into user-level funnel using SQL
- Calculated conversion rates at each stage
- Segmented performance by device and traffic source

## Key Insights
- Only ~23% of users proceed from session to product view, indicating a major top-of-funnel engagement issue
- Conversion rates are consistent across devices, suggesting UX is not the primary driver of drop-off
- Direct and internal traffic show significantly higher purchase conversion (~42–53%) vs Google/other sources (~39–41%)
- Low-performing channels likely bring low-intent users, impacting overall conversion

## Recommendations
- Improve landing page relevance and product discovery to increase product views
- Refine acquisition strategy to focus on high-intent traffic sources
- Leverage retargeting for direct and returning users

## Tools
SQL (BigQuery), Python (Pandas), Tableau / Power BI

## Project Structure
- /sql → funnel queries
- /notebooks → analysis (optional)
- /dashboard → screenshots or link
