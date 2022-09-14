class NewsModel {
  final String? image, title, tag, author, date;

  const NewsModel({
    this.image,
    this.title,
    this.tag,
    this.author,
    this.date,
  });

  // data for breaking news tab
  static const breakingNews = [
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/large_1SDzP6wn04q1RS-PFmbZ5LBgyImZ17nm-vCaot8Hq7c.jpg",
      title: "Blockchain is helping businesses respect green pledges",
      tag: "Finance",
      author: "No Author",
      date: "No Date",
    ),
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/large_7f0bI0qg4rXW9_QusS8Y80w-EDcCVdDoeAwNQc50j7k.jpg",
      title:
          "What is the optimal balance between in-person and remote working?",
      tag: "COVID-19",
      author: "Michaela Jarvis",
      date: "Sept 5th, 2022",
    ),
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/responsive_big_webp_TyW5kAYi2FZw3P059OZEypRJ7lHpkoT9BSgqWKiXO0w.webp",
      title: "Crypto mining can retire fossil fuels for good. Here's how",
      tag: "Blockchain",
      author: "Karen L. Jones",
      date: "Aug 10, 2022",
    ),
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/responsive_big_webp_1NPkosdkuy3kXPK8zvpuHF1sHrtESGG2dWUGI5UUs14.webp",
      title:
          "Should schools teach climate change studies? These countries think so",
      tag: "Climate",
      author: "Stefan Ellerbeck",
      date: "Aug 24, 2022",
    ),
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/responsive_big_webp_Qrx1pIfWpwJs4EknMawyWh4fPnq0REcAKIhtmQyLnPM.webp",
      title:
          "This chart shows how student-teacher ratios vary around the world",
      author: "Anna Fleck",
      date: "Sep 9, 2022",
    ),
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/responsive_big_webp_4Hb6csnt3hrxWYFwm-SBalSe7Q25GgEizdyjYzJSYYw.webp",
      title:
          "Japan has eased travel restrictions - but will the tourism sector bounce back?",
      tag: "Japan",
      author: "Naoko Kutty",
      date: "Sept 13th, 2022",
    ),
  ];

  // data for all news tab
  static const allNews = [
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/responsive_big_webp_v7teIW7TLAtSOvEk8Pzk7rDTwh3BTogKjU4nUrHPEDI.webp",
      title:
          "COVID-19: What you need to know about the coronavirus pandemic this week",
      tag: "Coronavirus",
      author: "Joe Myers",
      date: "Sept 12th, 2022",
    ),
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/responsive_big_webp_Pd8JRfrunBiidaZBUhct2iy-qTdQt06BcJbfP0na6AQ.webp",
      title:
          "How can national oil companies overcome the challenges of ESG reporting?",
      tag: "Oil & Gas",
      author: "Dough Johnston",
      date: "Sept 1st, 2022",
    ),
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/responsive_big_webp_A9HFMUV0FWEqCKpIlwfB7ktOIwoRYnQAgIFu5v8HlQU.webp",
      title:
          "EU countries are encouraging voluntary gas cuts - here's why and what to expect next",
      tag: "European Union",
      author: "Simon Read",
      date: "Sept 14th, 2022",
    ),
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/responsive_big_webp_8uv8aXEsZVJqS-O9YGqwpFzWqs1XH4ZRAeI9vRYyBZo.webp",
      title:
          "103 manufacturing sites are scaling innovations on our learning network",
      tag: "Manufacturing",
      author: "No Author",
      date: "No Date",
    ),
    NewsModel(
      image:
          "https://assets.weforum.org/article/image/responsive_big_webp_DivssRiKxTVjrJ_4WJdWi0iYtSt-JqiGgs_mrFK6oHQ.webp",
      title: "Carbon neutral and net zero - what do they mean?",
      tag: "Development",
      author: "Samuel Kingsley",
      date: "Aug 23rd, 2022",
    ),
  ];
}
