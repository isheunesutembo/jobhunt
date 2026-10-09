<img src="Image.jpeg"/>

# 💼 JobBoard App

A full-stack Job Board web application that allows users to browse job vacancies, save their favorite listings, upload resumes, and send applications directly to employers.

This app features a robust RESTful API built with **Express.js** and **MongoDB**, enabling seamless job listing management and user interaction.

---

## 🚀 Features

### 👨‍💼 User Features
- 🕵️ Browse available job vacancies
- ⭐ Add jobs to favorites
- 📄 Upload and manage resumes
- 📬 Submit job applications

### ⚙️ API Features
- ✅ RESTful API using **Express.js**
- 🗃️ MongoDB for data persistence
- 🔐 JWT-based authentication and authorization
- 🧑‍💻 Admin routes for posting, updating, and deleting jobs

---

## 🛠️ Tech Stack

- **Frontend**: _Coming soon / Integrate with any front-end framework_
- **Backend**: [Express.js](https://expressjs.com/)
- **Database**: [MongoDB](https://www.mongodb.com/)
- **Authentication**: JWT (JSON Web Tokens)
- **ORM**: Mongoose

---

## 📦 Installation

1. **Clone the repository**

```bash
git clone https://github.com/isheunesutembo/jobhunt.git
cd jobhunt

<img src="image.jpeg"/>
## Github Actions Workflow
name: Flutter CI

on:
  push:
    branches:
      - main
      - develop

  pull_request:
    branches:
      - main
      - develop

jobs:
  test-and-build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.35.0'
          channel: stable
          cache: true

      - name: Install dependencies
        run: flutter pub get

      - name: Analyze
        run: flutter analyze

      - name: Test
        run: flutter test

      - name: Build APK
        run: flutter build apk --release

      - name: Upload APK
        uses: actions/upload-artifact@v4
        with:
          name: flutter-apk
          path: build/app/outputs/flutter-apk/app-release.apk

