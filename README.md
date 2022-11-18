# Python Pub/Sub deployed on Cloud Run

> using a **Pub/Sub** push subscription deployed on serverless **Cloud Run** with **Cloud Build** ci/cd

<br />

## Creating a Pub/Sub topic


The sample service is triggered by messages published to a Pub/Sub topic

To create a new Pub/Sub topic, use the command
```gcloud
gcloud pubsub topics create myTopic
```


`app.py` will handle the incoming request and proccess the Pub/Sub messages

The service will return HTTP response codes. Success codes, such as HTTP 200 or 204, acknowledge complete processing of the Pub/Sub message. Error codes, such as HTTP 400

<br />

## Shipping the code

Shipping code with Cloud Build consists of three steps in `cloudbuild.yaml` which is triggered on a github repo. branch push event (ci/cd)

* Building the docker container image,
* Pushing the container image to Container Registry,
* Deploying the container image to Cloud Run

<br />

## Create a Pub/Sub subscription

To create a Pub/Sub subscription, use the command

```gcloud
gcloud pubsub subscriptions create mySubscription --topic myTopic \
--ack-deadline=600 \
--push-endpoint=SERVICE-URL/ # 👈SERVICE-URL is the HTTPS URL provided on deploying the service
```

## 🎉 Send a Pub/Sub message 🎉

Trying it out by sending a Pub/Sub message to the topic

```gcloud
gcloud pubsub topics publish myTopic --message "My Message"
```
