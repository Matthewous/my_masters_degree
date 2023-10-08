from datetime import date

# The Moscow Times - Wednesday, October 2, 2002
# The Guardian - Friday, 11.10.13
# Daily News - Thursday, 18 August 1977

times = date(2002,10,2)
guardian = date(2013,10,11)
daily_news = date(1977,8,18)

times = times.strftime('%A, %B %-d, %Y')
guardian = guardian.strftime('%A, %m.%d.%y')
daily_news = daily_news.strftime('%A, %d %B %Y')

print(times)
print(guardian)
print(daily_news)