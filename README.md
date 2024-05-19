Pet Adoption API
https://service-pet-adoption.onrender.com

Overview

The Pet Adoption API is a RESTful API built with Ruby on Rails, designed to empower users in managing pet adoption listings and owner profiles. It facilitates a seamless adoption experience for both pet seekers and shelters/owners.

It appears that you're utilizing the PostgreSQL database with the Pet Adoption API. PostgreSQL is renowned for its robust features and reliability, making it an excellent choice for storing pet and owner data within your application.

Features

    Comprehensive CRUD operations: Create, Read, Update, and Delete both pet listings and owner profiles.
    Enhanced breed information: Integrates with an external dog breed API to provide rich details about each pet's breed.
    Asynchronous data updates: Utilizes a background job to fetch breed data from the external API and update the database periodically, ensuring up-to-date information.
    ... (add any other significant features)

Getting Started

    Clone the repository:
   

    git clone https://github.com/Marciohenr1que/service-pet-adoption.git

   

Install dependencies:


cd service-pet-adoption
bundle install



Set up the database:


rails db:migrate



Start the server:


rails server



    This will start the API server, allowing you to interact with it using HTTP requests.

Background Job for API Data Update

The Pet Adoption API leverages a background job to maintain the accuracy and freshness of breed information. This job fetches data from an external dog breed API at regular intervals and updates the internal database accordingly.

Technical Details:

    Worker Implementation: The job utilizes Sidekiq, a popular background processing library for Ruby on Rails. The ReadApiWorker class is responsible for fetching and updating breed data.
    Job Scheduling: Sidekiq Scheduler manages the execution frequency of the ReadApiWorker job. By default, it runs hourly, but you can customize this in the Sidekiq configuration file.
    Monitoring and Management: Monitor the background job's performance and status using the Sidekiq Web interface, accessible at /sidekiq in your browser.

Dependencies

This project relies on several essential Ruby gems:

    Rails: The web application framework used to build the API.
    PostgreSQL: The relational database for storing pet and owner data. (Replace with your actual database if different)
    Roda: (Optional) A lightweight web framework often used for smaller API projects.
    Sidekiq: The background processing library responsible for asynchronous data updates.
    Sidekiq Scheduler: The component of Sidekiq that schedules background job execution.
    HTTParty: A library that simplifies making HTTP requests to external APIs for fetching breed data.
    RuboCop: A code linter that enforces code style and quality standards. (Optional)
    ... (list any other relevant dependencies)
