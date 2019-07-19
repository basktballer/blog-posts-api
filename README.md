## README for Blog Posts API

### Installation

To install the Blog Posts API, navigate to the root folder and execute the following

```
bundle install
```

### Running the Application

To run the application, execute the following

```
rails s
```

Navigate to localhost:3000/api/ping to validate site is working

### Description

The Blog Posts API was created using Ruby on Rails API scaffold. The API allows users to request for blog posts by tags and sort by likes, reads, popularity and id in both ascending and descending order. The following is an example request: "localhost:3000/api/posts?tags=history,tech&sortBy=likes&direction=desc".