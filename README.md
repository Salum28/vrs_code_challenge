# 🏠 Real Estate Advertisement System

Full Stack application for managing real estate advertisements for sale or rent, including BRL → USD currency conversion and integration with the ViaCEP public API.

> **Current Status:** Backend and Database fully implemented.
> Frontend (Flutter Desktop) in development.

---

# 📌 Project Overview

This project was developed as a technical challenge for a Full Stack Developer position.

The system allows:

* Creation and listing of real estate advertisements
* Address lookup by ZIP code (CEP) via ViaCEP API
* Manual address input fallback when external service fails
* Registration of BRL → USD exchange rates
* Automatic price conversion using the latest exchange rate
* Paginated listing of advertisements
* Image upload support (optional)

---

# 🏗 Architecture

## Backend (Go)

The backend follows a layered architecture with clear separation of responsibilities:

* **Handler Layer** → HTTP transport and request/response handling
* **Service Layer** → Business rules and validations
* **Atomic Layer** → Atomic actions (only do one thing) and query layer consumption 
* **Repository Layer** → Integration with other APIs -> ViaCep Requests
* **Query Layer** → Queries to database

---

# 🧰 Technologies Used

## Backend

* Go
* PostgreSQL
* Docker
* Docker Compose

## Database

* PostgreSQL

---

# 🗄 Database Structure

Main entities:

* **Listing** -> Contains adresses to reduce API complexity
* **ExchangeRate**

The exchange rate used for conversion is always the most recently created record.

---

# 🌎 External Integration

The backend integrates with the public ViaCEP API:

```
https://viacep.com.br/ws/{cep}/json/
```

The integration includes proper handling for:

* API unavailability
* Timeouts
* Invalid responses

If the external service fails, the API returns a controlled error response, allowing the frontend to enable manual address input.

---

# 📚 API Endpoints

## 📌 Advertisements

**Create Listing**

```
POST /listings/create-listing
```

**List Listings (Paginated)**

```
POST /listings/get-listings
```

---

## 💱 Exchange Rates

**Create Exchange Rate**

```
POST /exchange-rates/create-exchange-rate
```

**Get Latest Exchange Rate**

```
GET /exchange-rates/get-current-exchange-rate
```

---

## 📍 Address Lookup

**Search Address by ZIP Code**

```
POST /cep/get-cep
```

---

# 🚀 Running the Project

## 🐳 Using Docker (Recommended)

### 1. Clone the repository

```
git clone https://github.com/Salum28/vrs_code_challenge.git
cd vrs_code_challenge
```

### 2. Build and start containers

```
docker-compose up --build
```

The API will be available at:

```
http://localhost:8080
```

---


# 📌 Error Handling Strategy

* There are helper functions to deal with custom errors for all cases and all the layers in the API

---

# 🛠 Current Development Status

| Component          | Status         |
| ------------------ | -------------- |
| Backend API        | ✅ Completed    |
| Database           | ✅ Completed    |
| ViaCEP Integration | ✅ Completed    |
| Docker Setup       | ✅ Completed    |
| Flutter Frontend   | 🚧 In Progress |

---

# 🔮 Next Steps

* Finalize Flutter Desktop frontend
* Implement full internationalization (PT/EN)
* Add frontend automated tests

---

# 📎 Author Notes

This project emphasizes:

* Clean separation of concerns
* Robust error handling
* Predictable behavior under external service failures
* Centralized business logic
* Scalable pagination strategy

The focus was to ensure backend reliability, maintainability, and readiness for frontend integration.