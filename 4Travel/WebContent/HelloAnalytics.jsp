<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hello Analytics - A quickstart guide for JavaScript</title>
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>


<script>

  // Replace with your client ID from the developer console. https://console.developers.google.com/apis/credentials

  var CLIENT_ID = '160209807606-df5os0jsh96u5tef9930a0f26hapvush.apps.googleusercontent.com';

  // Replace with your view ID. from https://ga-dev-tools.appspot.com/account-explorer/

  var VIEW_ID = '148586598';

  var DISCOVERY = 'https://analyticsreporting.googleapis.com/$discovery/rest';

  var SCOPES = ['https://www.googleapis.com/auth/analytics.readonly'];



  function authorize(event) {

    // Handles the authorization flow.

    // `immediate` should be false when invoked from the button click.

    var useImmdiate = event ? false : true;

    var authData = {

      client_id: CLIENT_ID,

      scope: SCOPES,

      immediate: useImmdiate

    };

    gapi.auth.authorize(authData, function(response) {

      if (response.error) {

	$(".getViews").text("인증필요");

      }

      else {

	$(".getViews").text("불러오는 중");

        queryReports();

      }

    });

  }



  function queryReports() {

    // Load the API from the client discovery URL.

    gapi.client.load(DISCOVERY

    ).then(function() {

        // Call the Analytics Reporting API V4 batchGet method.

        gapi.client.analyticsreporting.reports.batchGet( {

          "reportRequests":[

          {

            "viewId":VIEW_ID,

            "dateRanges":[

              {

                "startDate":"7daysAgo",

                "endDate":"today"

              }],

            "dimensions": [

              {

                "name": "ga:pagePath"

              }],

            "dimensionFilterClauses": [

              {

                "filters": [

                  {

                    "dimensionName": "ga:pagePath",

                    "not": false,

                    "expressions": [

                      "\\"+location.pathname

                    ],

                    "caseSensitive": false,

                  }

                ]

              }],

            "metrics":[

              {

                "expression":"ga:hits"

              }],

            "orderBys": [

              {

                "fieldName": "ga:hits",

                "sortOrder": "DESCENDING",

              }

            ],

          }]

        } ).then(function(response) {

          var parse = JSON.parse(response.body);

          var views = "지난 1주일간 조회수: "+parse.reports[0].data.totals[0].values[0];

          console.log(views);

	  $(".getViews").text(views);

        })

        .then(null, function(err) {

            // Log any errors.

            console.log(err);

        });

    });

  }

 $(".getViews").click(function(){authorize(event);});
		
</script>

<script async src="https://apis.google.com/js/client.js"></script>
<div class="getViews">aaaa</div>



</body>

<script src="https://www.gstatic.com/firebasejs/3.8.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyDY0Wq21y6Knp32_j_LAIuKMfTvUqpYZSg",
    authDomain: "travel-165306.firebaseapp.com",
    databaseURL: "https://travel-165306.firebaseio.com",
    projectId: "travel-165306",
    storageBucket: "travel-165306.appspot.com",
    messagingSenderId: "160209807606"
  };
  firebase.initializeApp(config);
</script>
</html>
