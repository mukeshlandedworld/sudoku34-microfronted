# Sudoku Microfrontend Java Web Application

This project demonstrates how to develop a microfrontend web application using Java without any MVC framework and JavaFX. It provides a simple UI for users to enter a number, validate the input, and display alerts based on the validation result. The validation is performed by calling an external Sudoku microservice.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Deployed Version](#deployed-Version)

## Prerequisites

Before running the Docker commands, make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/): Make sure Docker Desktop or Docker Engine is installed and running on your system.
- [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html): Install JDK 11 or later.
- Apache Tomcat (or any other servlet container)
- curl (for testing with the Sudoku microservice)

## Project Structure

1. The project directory structure is as follows:

   ```bash
   - sudoku34-microfronted
   - Dockerfile # Contains instructions for building the Docker image.
   - tomacat.war # The WAR file of your Java web application.
   - README.md # This file providing instructions and documentation.
   - Other project files...


## Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/mukeshlandedworld/sudoku34-microfronted.git

2. Navigate to the project directory:

   ```bash
   cd sudoku34-microfronted

4. Compile the Java source files:

   ```bash
   javac -d WEB-INF/classes src/com/sudoku/servlets/*.java

6. Package the web application into a WAR file:

   ```bash
   jar -cvf sudoku.war *

7. Deploy the WAR file to your Tomcat server:

   Copy the sudoku.war file to the webapps directory of your Tomcat installation.

8. Start your Tomcat server.

9. Open your web browser and navigate to http://localhost:8080/ to access the Sudoku microfrontend application.

6. Build the MVN Package:

   ```bash
   mvn clean install

6. Build the Docker image:

   ```bash
   docker build -t sudoku34-tomacat-image .

6. Run the Docker container:

   ```bash
   docker run -d -p 8080:8080 sudoku34-tomacat-image

13. Access the web application:

    Open your web browser and navigate to http://localhost:8080/ to view the deployed web application.

## Deployed Version

The Sudoku Microfronted is also deployed on Azure. You can access the deployed version using the following URL:

https://sudoku34-web-app.azurewebsites.net/
