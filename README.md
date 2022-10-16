# Show Me Tweets
Welcome to Show Me Tweets! This is a backend portion of 2-part application deisigned with a separate *[Frontend](https://github.com/psitosam/nr_frontend)*. This backend application is responsible for retrieving tweet data from the Twitter API. Currently, the topics of tweets are limited to "healthcare", "nasa", and "opensource". The tweets retrieved are limited to those categorized as being in the English language. In the deployed application, the backend periodically (every 10 minutes) retrieves ten tweets for each category from the Twitter API and stores them in the database, via the rake db:seed command located in a Cron Job on the Heroku CLI.

## Implementation

### Installation and Setup

1. Clone and implement the *[Frontend](https://github.com/psitosam/nr_frontend)*
2. In a separate repository, clone this repo
3. Run the following commands to install gem dependencies and create a database:
```bash
bundle install
rails db:{drop,create,migrate,seed}
```
4. This build makes use of the Figaro gem to hide sensitive environment variables. Currently, the only variable being obscured is the "twitter_bearer_token", which was obtained by registering for a Twitter developer account. In order to have full functionality, make sure to visit the Twitter developer page, register, and generate this token. This will grant you consumer access to the Twitter API, and is needed to make the application run. Once you have a token, install Figaro:
```bash
bundle exec figaro install
```
after bundling. This will generate an application.yml file at config/application.yml, in which you will need to add the following snippet:
```ruby
twitter_bearer_token: "your token goes here"
```
In the future, additional functionality may be built out that requires additional authorization, but for now this is all that is needed to hit the API and retrieve Tweets.

5. Run:
```bash
rails s
```
on both the FE and BE applications to ensure both are running simultaneously. Double check that the config/puma.rb files are set to listening on different ports! Right now, the backend is set up to listen on localhost:3000, and the frontend listens on localhost:5000.

6. You're up and running! We recommend you run
```bash
bundle exec rspec
```
and ensure all tests pass before deploying this software.

### Dependencies

This application was written for 
* rails 7.0.4
* ruby 3.1.0
because these were base requirements for deploying the application to production in a Heroku environment. It is important that you have installed and are using these versions in order to ensure functionality.

## Endpoints Consumed

* `GET api.twitter.com/2/tweets/search/recent?max_results=10&tweet.fields=created_at,lang&query=opensource%20lang%3Aen`

Retrieves 10 tweets from the Twitter API for the query parameter "opensource", includes the created_at attribute to see how recent it is, and makes sure it is in the English language. Note that only Tweets that have been categorized as being in English have this attribute. An example response looks like this:

```
{
    "data": [
        {
            "created_at": "2022-10-13T22:20:02.000Z",
            "id": "1580684815325573121",
            "text": "RT @thenewstack: Rust in the Linux Kernel https://t.co/wJMWSYsnQM\n#Linux #OpenSource #SoftwareDevelopment https://t.co/6dPL7i39aj",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580684815325573121"
            ]
        },
        {
            "created_at": "2022-10-13T22:20:00.000Z",
            "id": "1580684805775462400",
            "text": "RT @unixbhaskar: Phew!! Bloody hell ....wondering ..\n\n#linux #research #linuxadmin #sysadmin #opensource #gentoo https://t.co/m8VnmVLji1",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580684805775462400"
            ]
        },
        {
            "created_at": "2022-10-13T22:19:44.000Z",
            "id": "1580684739073445888",
            "text": "RT @gretel_ai: Sweep 🧹 --&gt; optimize --&gt; synthesize --&gt; analyze. Rinse and repeat!\n\nAlways fun training #syntheticdata models with @weights_…",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580684739073445888"
            ]
        },
        {
            "created_at": "2022-10-13T22:19:35.000Z",
            "id": "1580684704403304448",
            "text": "RT @unixbhaskar: Linux Git Quick Stats With Bash Script 2022_10_14_02:42:36 https://t.co/gydmZ1vbc4 via @YouTube \n\n#linux #research #git #s…",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580684704403304448"
            ]
        },
        {
            "created_at": "2022-10-13T22:19:28.000Z",
            "id": "1580684673851981824",
            "text": "RT @Apereo: #OSS in #HigherEd\n\nResearchers at the Institute for the Wireless Internet of Things at @Northeastern University are pleased to…",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580684673851981824"
            ]
        },
        {
            "created_at": "2022-10-13T22:17:49.000Z",
            "id": "1580684256262598656",
            "text": "RT @Superalgos: At #Superalgos, #opensource #developers get rewards in the native token. That is our token distribution model. Simple. Let…",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580684256262598656"
            ]
        },
        {
            "created_at": "2022-10-13T22:17:30.000Z",
            "id": "1580684176470188045",
            "text": "Write a program to find smallest number in an array\n\nhttps://t.co/Urml9uHgOF\n\n#GoodFirstIssue #OpenSource #Codinasion #Hacktoberfest #Hacktoberfest2022",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580684176470188045"
            ]
        },
        {
            "created_at": "2022-10-13T22:17:02.000Z",
            "id": "1580684059545456640",
            "text": "Rust in the Linux Kernel https://t.co/wJMWSYsnQM\n#Linux #OpenSource #SoftwareDevelopment https://t.co/6dPL7i39aj",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580684059545456640"
            ]
        },
        {
            "created_at": "2022-10-13T22:16:35.000Z",
            "id": "1580683948950138881",
            "text": "RT @AusGameBulletin: 'Kamigen Issue 2 Cover' Pullover Sweatshirt https://t.co/1XlOpIPv9M  #indiegamedev #kamigen #scifi #cyberpunk #mystica…",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580683948950138881"
            ]
        },
        {
            "created_at": "2022-10-13T22:16:01.000Z",
            "id": "1580683807228776448",
            "text": "Phew!! Bloody hell ....wondering ..\n\n#linux #research #linuxadmin #sysadmin #opensource #gentoo https://t.co/m8VnmVLji1",
            "lang": "en",
            "edit_history_tweet_ids": [
                "1580683807228776448"
            ]
        }
    ],
    "meta": {
        "newest_id": "1580684815325573121",
        "oldest_id": "1580683807228776448",
        "result_count": 10,
        "next_token": "b26v89c19zqg8o3fpzejg3cwwn8kv6izg4rmss46dxn5p"
    }
}
```
* This information is then turned into Tweet objects, and the Tweet is given an additional attribute ("subject") via the rake db:seed command and stored locally in the database. The "subject" attribute is how the Tweets Controller queries the local database to respond to queries from the front end. The other two queries look similar, but pass either "NASA" or "healthcare" as the query parameters.
* When running, the backend application runs these queries sequentially every ten minutes to ensure up-to-date Tweets are retrieved, after destroying all the previous Tweets in the database. This Cron Job was built in the Heroku UI, a requirement for using Heroku to deploy the application. The code for this job is located in seeds.rb, and the command to the Cron Job is simply:
```bash
rake db:seed
```

## Endpoints Exposed

* `GET /api/v1/tweets`
Example response, query parameters - `opensource`

```
{
  "data": [
    {
      "id": 41,
      "attributes": {
        "created_at": "2022-10-16T13:54:17.000Z",
        "text": "RT @AI_Advice: The Ultimate List of #DataScience Skills\n\n#5G #100DaysOfCode #AI #Analytics #ArtificialIntelligence #BigData #Cloud #Data #I…",
        "edit_history_tweet_ids": [
          "1581644702058967040"
        ],
        "subject": "opensource"
      }
    },
    {
      "id": 42,
      "attributes": {
        "created_at": "2022-10-16T13:54:17.000Z",
        "text": "RT @AI_Advice: #AI/ #DataScience/ #MachineLearning:\nFREE #Infographic on Deep Learning Use Cases\n\n#5G #100DaysOfCode #Analytics #Artificial…",
        "edit_history_tweet_ids": [
          "1581644702046035968"
        ],
        "subject": "opensource"
      }
    },
    {
      "id": 43,
      "attributes": {
        "created_at": "2022-10-16T13:54:17.000Z",
        "text": "RT @AI_Advice: #AI/ #DataScience/ #MachineLearning:\nFREE #Infographic on Deep Learning Use Cases\n\n#5G #100DaysOfCode #Analytics #Artificial…",
        "edit_history_tweet_ids": [
          "1581644702042161159"
        ],
        "subject": "opensource"
      }
    },
    {
      "id": 44,
      "attributes": {
        "created_at": "2022-10-16T13:54:17.000Z",
        "text": "RT @AI_Advice: #MachineLearning Takes Hold in Nuclear Physics\n\nhttps://t.co/ZklenvyZBH\n\n#5G #100DaysOfCode #AI #Analytics #ArtificialIntell…",
        "edit_history_tweet_ids": [
          "1581644701996052480"
        ],
        "subject": "opensource"
      }
    },
    {
      "id": 45,
      "attributes": {
        "created_at": "2022-10-16T13:54:16.000Z",
        "text": "RT @AI_Advice: #AI/ #DataScience/ #MachineLearning:\nFREE #Infographic on Deep Learning Use Cases\n\n#5G #100DaysOfCode #Analytics #Artificial…",
        "edit_history_tweet_ids": [
          "1581644699362013184"
        ],
        "subject": "opensource"
      }
    },
    {
      "id": 46,
      "attributes": {
        "created_at": "2022-10-16T13:54:09.000Z",
        "text": "RT @ManavGambhir11: An amazing session to attend.Learnt about whatnot, from opensource to web3, I got to know about all. An amazing opportu…",
        "edit_history_tweet_ids": [
          "1581644671721566209"
        ],
        "subject": "opensource"
      }
    },
    {
      "id": 47,
      "attributes": {
        "created_at": "2022-10-16T13:54:01.000Z",
        "text": "RT @AI_Advice: #AI/ #DataScience/ #MachineLearning:\nFREE #Infographic on Deep Learning Use Cases\n\n#5G #100DaysOfCode #Analytics #Artificial…",
        "edit_history_tweet_ids": [
          "1581644635189182465"
        ],
        "subject": "opensource"
      }
    },
    {
      "id": 48,
      "attributes": {
        "created_at": "2022-10-16T13:53:59.000Z",
        "text": "RT @AI_Advice: The Ultimate List of #DataScience Skills\n\n#5G #100DaysOfCode #AI #Analytics #ArtificialIntelligence #BigData #Cloud #Data #I…",
        "edit_history_tweet_ids": [
          "1581644627203227649"
        ],
        "subject": "opensource"
      }
    },
    {
      "id": 49,
      "attributes": {
        "created_at": "2022-10-16T13:53:58.000Z",
        "text": "RT @Khushi1950: What I'm taking away from #hackthisfallhacktoberfest meet-up today?\n\n\"Come for swags, stay for the community❤️\"\n\nIt's a rea…",
        "edit_history_tweet_ids": [
          "1581644623562567681"
        ],
        "subject": "opensource"
      }
    },
    {
      "id": 50,
      "attributes": {
        "created_at": "2022-10-16T13:53:56.000Z",
        "text": "RT @AI_Advice: #AI/ #DataScience/ #MachineLearning:\nFREE #Infographic on Deep Learning Use Cases\n\n#5G #100DaysOfCode #Analytics #Artificial…",
        "edit_history_tweet_ids": [
          "1581644613609082882"
        ],
        "subject": "opensource"
      }
    }
  ]
}
```

### Thank you for looking at my code! Any questions or concerns, please open an issue here on GitHub or contact me here:


## Contact
### Contributors

* Alex Psitos     | [Github](https://github.com/psitosam) | [LinkedIn](https://www.linkedin.com/in/alex-psitos-5429a1232/) | [Portfolio](https://www.alexpsitos.dev)
