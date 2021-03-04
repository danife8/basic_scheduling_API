# BASIC SCHEDULING API v1

## Features
- Basic CRUD of Students and Courses
- Basic inscription of students on courses

## Scopes
The requisites for this exam was create a model Student and a model Class. As class is a reserved word, I took the liberty to change the name to Course. I also, created an intermediate model for store every inscriptions of students on courses.
## Installation
This little project was created with the following dependencies:
- Ruby 3.0.0
- Rails 6.0.3
- PostgreSQL 13.1

Steps:
```
1. clone repository
2. create .env.development file with your own database access configuration
-- BASIC_SCHEDULING_API_DATABASE_USERNAME=
-- BASIC_SCHEDULING_API_DATABASE_PASSWORD=
3. bundle install
4. rails db:create
5. rails db:migrate
```

## Data validations

- Course Model:
```
code -> Uniqueness and Presence
title -> Uniqueness and Presence
```
- Student Model:
```
student_id -> Uniqueness and Presence
first_name -> Presence
last_name -> Presence
```
- Inscription Model:
```
course_id -> Presence
student_id -> Presence
course_id && student_id -> Uniqueness
```

## API Documentation
### **Courses**
* Courses INDEX
  
  URL: `GET /api/v1/courses`    
  Response: 
  ```
    {
      "message": null,
      "keyword": null,
      "courses": [
        {
          "id": 1,
          "code": "10001",
          "title": "Math-I",
          "description": "Math I for Electric Engineering"
        },
        {
          "id": 2,
          "code": "10010",
          "title": "Physics-II",
          "description": "Physics II for Electric Engineering"
        }
      ]
    }
    ```
* Courses SEARCHABLE :params
  
  URL: `GET /api/v1/courses`    
    Params:
  ```
  {
    "key": "code" || "title" || "description",
    "value": "100"
  }
  ```
  Response:  
  ```
  {
    "message": null,
    "keyword": null,
    "courses": [
        {
          "id": 1,
          "code": "10001",
          "title": "Math-I",
          "description": "Math I for Electric Engineering"
        },
        {
          "id": 2,
          "code": "10010",
          "title": "Physics-II",
          "description": "Physics II for Electric Engineering"
        }
      ] 
  }
  ```


* Courses CREATE :params
  
  URL: `POST /api/v1/courses`    
  Params:
  ```
  {
  "code": "20001",
  "title": "Data Structures",
  "description": "Data structures of System Engineering"
  }
  ```
  Response:  
  ```
  {
  "message": null,
  "keyword": null,
  "course": {
    "id": 3,
    "code": "20001",
    "title": "Data Structures",
    "description": "Data structures of System Engineering",
    "students": []
  }
  ```

* Courses SHOW :id
  
  URL: `GET /api/v1/courses/3`
  Response:  
  ```
  {
  "message": null,
  "keyword": null,
  "course": {
    "id": 3,
    "code": "20001",
    "title": "Data Structures",
    "description": "Data structures of System Engineering",
    "students": []
  }
  ```
  
* Courses UPDATE :id :params
  
  URL: `PATCH /api/v1/courses/3`    
  Params:
  ```
  {
  "code": "20002",
  "title": "Data Structures II",
  }
  ```
  Response:  
  ```
  {
  "message": null,
  "keyword": null,
  "course": {
    "id": 3,
    "code": "20002",
    "title": "Data Structures II",
    "description": "Data structures of System Engineering",
    "students": []
  }
  ```
  
* Courses DESTROY :id
  
  URL: `DELETE /api/v1/courses/3`    
  Response: 
  ```
    {
      "message": null,
      "keyword": null,
      "courses": [
        {
          "id": 1,
          "code": "10001",
          "title": "Math-I",
          "description": "Math I for Electric Engineering"
        },
        {
          "id": 2,
          "code": "10010",
          "title": "Physics-II",
          "description": "Physics II for Electric Engineering"
        }
      ]
    }
    ```
### **Students**
* Students INDEX
  
  URL: `GET /api/v1/students`    
  Response: 
  ```
    {
      "message": null,
      "keyword": null,
      "students": [
        {
          "id": 1,
          "student_id": "111000",
          "first_name": "John",
          "last_name": "Doe"
        },
        {
          "id": 2,
          "student_id": "111001",
          "first_name": "Jane",
          "last_name": "Doe"
        }
      ]
    }
    ```
* Students SEARCHABLE :params
  
  URL: `GET /api/v1/students`    
    Params:
  ```
  {
    "key": "student_id" || "first_name" || "last_name",
    "value": "Doe"
  }
  ```
  Response:  
  ```
  {
    "message": null,
    "keyword": null,
    "students": [
        {
          "id": 1,
          "student_id": "111000",
          "first_name": "John",
          "last_name": "Doe"
        },
        {
          "id": 2,
          "student_id": "111001",
          "first_name": "Jane",
          "last_name": "Doe"
        }
      ] 
  }
  ```

* Students CREATE :params
  
  URL: `POST /api/v1/students`    
  Params:
  ```
  {
  "student_id": "111002",
  "first_name": "Michael",
  "last_name": "Dove"
  }
  ```
  Response:  
  ```
  {
  "message": null,
  "keyword": null,
  "course": {
    "id": 3,
    "student_id": "111002",
    "first_name": "Michael",
    "last_name": "Dove",
    "courses": []
  }
  ```

* Students SHOW :id
  
  URL: `GET /api/v1/students/3`
  Response:  
  ```
  {
  "message": null,
  "keyword": null,
  "course": {
    "id": 3,
    "student_id": "20001",
    "first_name": "Michael",
    "last_name": "Dove",
    "courses": []
  }
  ```
  
* Students UPDATE :id :params
  
  URL: `PATCH /api/v1/students/3`    
  Params:
  ```
  {
  "last_name": "Doe",
  }
  ```
  Response:  
  ```
  {
  "message": null,
  "keyword": null,
  "course": {
    "id": 3,
    "student_id": "20002",
    "first_name": "Michael",
    "last_name": "Doe",
    "courses": []
  }
  ```
  
* Students DESTROY :id
  
  URL: `DELETE /api/v1/students/3`    
  Response: 
  ```
    {
      "message": null,
      "keyword": null,
      "students": [
        {
          "id": 1,
          "student_id": "111000",
          "first_name": "John",
          "last_name": "Doe"
        },
        {
          "id": 2,
          "student_id": "111001",
          "first_name": "Jane",
          "last_name": "Doe"
        }
      ]
    }
    ```



### **Inscriptions**
* Inscription INDEX
  
  URL: `GET /api/v1/inscriptions`    
  Response: 
  ```
    {
      "message": null,
      "keyword": null,
      "inscriptions": [
        {
          "id": 1,
          "course_id": 1,
          "student_id": 1
        },
        {
          "id": 2,
          "course_id": 1,
          "student_id": 2
        }
      ]
    }
  ```

* Inscription CREATE :params
  
  URL: `POST /api/v1/inscriptions`
  
  Params:
  ```
  {
  "course_id": 2,
  "student_id": 1
  }
  ```
  Response: 
  ```
    {
      "message": null,
      "keyword": null,
      "inscription": {
        "id": 3,
        "course_id": 2,
        "student_id": 1
      }
    }
  ```

* Inscription DESTROY :id
  
  URL: `DELETE /api/v1/inscriptions/3`    
  Response: 
  ```
    {
      "message": null,
      "keyword": null,
      "inscriptions": [
        {
          "id": 1,
          "course_id": 1,
          "student_id": 1
        },
        {
          "id": 2,
          "course_id": 1,
          "student_id": 2
        }
      ]
    }
  ```