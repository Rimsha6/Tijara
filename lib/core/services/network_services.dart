// import 'dart:developer';
// import 'dart:convert';
//
// class NetworkServices {
//
//
// // Use service account credentials to get an authenticated and auto refreshing client.
//   static  Future<String> obtainAuthenticatedClient() async {
//     final accountCredentials = ServiceAccountCredentials.fromJson({
//       "type": "service_account",
//       "project_id": "customizable-hostel",
//       "private_key_id": "217cf8d373e6996a35f532c03645613d106a7ecd",
//       "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCuZPYbUurQJzhl\naw0P4PR8wL8kuC11mJ4r0L8uHx8WPB+CwBqZdasSwayHPU46OYVY6x+l6FS7lKu7\ngkgvrd/wrS9osGb/eG5md8G6o+nDc38G+swe2Dtj5YNSlwVmJcBrTPwQ43OPT4LC\nYwPDfsSQpk3SqH7E9AzYVlSxfK776rTc53rT/51mLI0l7jcKVjYfVEA9aV59yhsV\nHJsRVEKajT164wdDAb08YArGnMhDhnowCJhTo5x9eiHu4BKDXqRXUo6XC2yIqHYF\n5jDmq4M/el6hMIPX9WYFHgx0XTjFGj8iKLPXhMizS2TTOgIf5Is+l624w0n6jMBa\n8yfqZk1BAgMBAAECggEADCUgQ2vgyglADmrsxioao5JdFEakLGXg5FiyD73a9gQ8\nmLFCpGTeqE7QKSmDvzop2ZBaUKrooytXm81N/Tt7v6ehGoZoKU94ADhobEIBDUS+\noU5OcGhUPDfU/Tn1GIM+rn7j8i+4VnSXBf9L/btN+rUtp9nUStZbVKZ5WQs/pm/w\nCFCI56sUP/iSYiKGwZtgEtfNKVdzkktX0/CUwlnyyAzFI8CoxJr0V4pPBchF7rYx\n+G2vZ9GvSSaQxJgm383T9q08JyVuruFQuIYv4XGKhoSyK0WW9SfwYAXlNGkt5Jyc\neWeNN3LhYbTZci4Bu9sjSaY1OX6MizB8DWHERWsWXwKBgQDsYhh7lXMQAlj0DLxN\nc8TN/7GFaEIBLJYJJGxIRxgrxNNAa2apWECmq39lAoMqmxhjtaElsiTTTwn/RRHT\nrLY8S6FVVu+/tyX0GyBdDFKf4w3vGge6PEn+9cFXM/N9ghqMf/MMhY2hRCXLN5x4\niDLU6VDB1cO91d8GrvyK232LZwKBgQC83e2ncpoI2pVrCmyb6F1AsBlicDiTvCoR\nL+hYruk/mb9CJXr/3/XeODPPUd4evQ9hlYbrcvSOuoH+Ia3WzTH+LM5zxGqQR2pn\nLdV3TwT1c2h9pgO2BNADAlWC/VTgfUSzNKbdcXmHhBRiP8hARS46hIyi/nuvYfSl\nWLQXAhWhFwKBgFRMt4Z7ScmPzMFcOVs1yh3c7iYxhDh++hLQln1APXJ+gwgaRUZn\nXscRqiEPwE9VeGE2yP10hoWFTn9m1nCyy1q9bg/NLTslybdAZU5Jsr2qb7Gxisfz\n8D+ozQaYVGGSIH2ys67nghbdAs1yS68Ag4BCpLY70c7FkwADL7UliaRJAoGAW9mS\nOl0BjEzBXc00BJ58u3jo33a0DST1UGZ8GKT3ynZ7DTAtIUNJz0iF6c1muIw5brvJ\nYbgGN2N81JqMcGpaZcJkpOhg6snQdV1U8zD6uGPn7TNPmrW8c7ou3AVXwdUqE/0H\nKaqF7+HMB/v850S9tre/rYUVobWBxOferVHWMwECgYEAgrPCPQo1w8Y4scT9H6q6\nw8v96ld7cGozp9nx4OgrEvjoMniGJ2MnT2PrpPw5Uv85lRaKTyq/VrwHSpiUJwe+\n4qngbFuGvYFDtR9bU1bcsnTWB+ipnhsc6WsTdxuHabTi1GcWRwJlr2sLriqeitd/\neCcyC9h+jOx2vUSGKIFre6U=\n-----END PRIVATE KEY-----\n",
//       "client_email": "firebase-adminsdk-i5cic@customizable-hostel.iam.gserviceaccount.com",
//       "client_id": "111582373034803474607",
//       "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//       "token_uri": "https://oauth2.googleapis.com/token",
//       "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//       "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-i5cic%40customizable-hostel.iam.gserviceaccount.com",
//       "universe_domain": "googleapis.com"
//     });
//     var scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
//
//     AuthClient client = await clientViaServiceAccount(
//         accountCredentials, scopes);
//
//     log('accesstoken '+client.credentials.accessToken.data);
//
//     return client.credentials.accessToken.data;
//   }
//
//
//   static Future sendNotification(
//       {String? token, String? title, String? body}) async {
//
//     String accessToken = await obtainAuthenticatedClient();
//     String serverKey =
//         'Bearer ' + accessToken;
//     Map<String, String> headerMap = {
//       "Content-Type": "application/json",
//       "Authorization": serverKey
//     };
//
//     Map notificationMap = {'title': title, 'body': body};
//
//     Map dataMap = {
//       "click_action": "FLUTTER_NOTIFICATION_CLICK",
//       "id": "1",
//       "status": "done",
//     };
//
//     Map bodyMap = {
//       "message":{
//         "token":token,
//         "notification":notificationMap,
//         "data": dataMap,
//       }
//     };
//
//     var response = await http.post(
//         Uri.parse('https://fcm.googleapis.com/v1/projects/customizable-hostel/messages:send'),
//         headers: headerMap,
//         body: jsonEncode(bodyMap));
//
//     log("responseee ${response.body}");
//     var data = jsonDecode(response.body);
//
//
//
//
//
//     return ;
//   }
// }