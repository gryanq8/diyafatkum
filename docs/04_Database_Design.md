# Database Design

## Tables

001_profiles

002_provider_businesses

003_provider_documents

004_customer_addresses

005_services

006_packages

007_requests

008_messages

009_complaints

010_reviews

---

## Relationships

profiles
│
├── provider_businesses
│      ├── provider_documents
│      ├── services
│      └── packages
│
└── customer_addresses

requests
│
├── messages
├── complaints
└── reviews
