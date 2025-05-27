# Software Requirements Specification
## For Music Subscription Service

Version 0.1  

Prepared by Antoine Wimberly & Jay Park

CSC340 - Group 4 

May 26, 2025

Table of Contents
=================
* [Revision History](#revision-history)
* 1 [Introduction](#1-introduction)
  * 1.1 [Document Purpose](#11-document-purpose)
  * 1.2 [Product Scope](#12-product-scope)
  * 1.3 [Definitions, Acronyms and Abbreviations](#13-definitions-acronyms-and-abbreviations)
  * 1.4 [References](#14-references)
  * 1.5 [Document Overview](#15-document-overview)
* 2 [Product Overview](#2-product-overview)
  * 2.1 [Product Functions](#21-product-functions)
  * 2.2 [Product Constraints](#22-product-constraints)
  * 2.3 [User Characteristics](#23-user-characteristics)
  * 2.4 [Assumptions and Dependencies](#24-assumptions-and-dependencies)
* 3 [Requirements](#3-requirements)
  * 3.1 [Functional Requirements](#31-functional-requirements)
    * 3.1.1 [User Interfaces](#311-user-interfaces)
    * 3.1.2 [Hardware Interfaces](#312-hardware-interfaces)
    * 3.1.3 [Software Interfaces](#313-software-interfaces)
  * 3.2 [Non-Functional Requirements](#32-non-functional-requirements)
    * 3.2.1 [Performance](#321-performance)
    * 3.2.2 [Security](#322-security)
    * 3.2.3 [Reliability](#323-reliability)
    * 3.2.4 [Availability](#324-availability)
    * 3.2.5 [Compliance](#325-compliance)
    * 3.2.6 [Cost](#326-cost)
    * 3.2.7 [Deadline](#327-deadline)

## Revision History
| Name | Date    | Reason For Changes  | Version   |
| ---- | ------- | ------------------- | --------- |
|      |         |                     |           |
|      |         |                     |           |
|      |         |                     |           |

## 1. Introduction

### 1.1 Document Purpose
The purpose of this Software Requirements Document (SRD) is to define the functional and non-functional requirements for the Music Subscription Service application. 

### 1.2 Product Scope
Identify the product whose software requirements are specified in this document, including the revision or release number. Explain what the product that is covered by this SRS will do, particularly if this SRS describes only part of the system or a single subsystem. 
Provide a short description of the software being specified and its purpose, including relevant benefits, objectives, and goals. Relate the software to corporate goals or business strategies. If a separate vision and scope document is available, refer to it rather than duplicating its contents here.

### 1.3 Definitions, Acronyms and Abbreviations 
Java -    Java is a high-level, object-oriented programming language designed to be platform-independent.

Vscode - A lightweight, open-source code editor developed by Microsoft that supports multiple programming languages, extensions, and debugging tools, making it a popular choice for developers.

Springboot - A Java framework that makes it easy to create stand-alone, production-ready web applications quickly.                                                                                                              |

### 1.4 References
List any other documents or Web addresses to which this SRS refers. These may include user interface style guides, contracts, standards, system requirements specifications, use case documents, or a vision and scope document. Provide enough information so that the reader could access a copy of each reference, including title, author, version number, date, and source or location.

### 1.5 Document Overview
Describe what the rest of the document contains and how it is organized.

## 2. Product Overview
Music Subscription Service is a digital platform that provide music services to the user. Both users and artist and make use of the features provided.

### 2.1 Product Functions
Music Subscription Service allows artists to upload, respond to review, and make revenue. The user can browser and listen to music, subscribe to artists, and post reviews.

### 2.2 Product Constraints
This program will run on Java jdk 21 on computers.
  
### 2.3 User Characteristics
The program would expect the user to have knowledge of using a web browser.

### 2.4 Assumptions and Dependencies
List any assumed factors (as opposed to known facts) that could affect the requirements stated in the SRS. These could include third-party or commercial components that you plan to use, issues around the development or operating environment, or constraints. The project could be affected if these assumptions are incorrect, are not shared, or change. Also identify any dependencies the project has on external factors, such as software components that you intend to reuse from another project, unless they are already documented elsewhere (for example, in the vision and scope document or the project plan).

## 3. Requirements

### 3.1 Functional Requirements 
- FR0: The system shall allow users to create a profile either as a customer or an artist.
- FR1: The system shall allow artists to create new songs, and edit or remove them.
- FR2: The system shall allow artists to interact with customers by replying to their comments/feedback.
- FR3: The system shall allow artists to view their songs engagment by displaying streaming statistics.
- FR4: The system shall allow customers to select the following services: browse, listen, and download music.
- FR5: The system shall allow customers to subscribe to their desired artists.
- FR6: The system shall allow customers to write comments/feedback on songs of their choice.

#### 3.1.1 User interfaces
Web pages using HTML, CSS, and JavaScript.

#### 3.1.2 Hardware interfaces
Devices that have web browser capabilities.

#### 3.1.3 Software interfaces
- Java jdk 21
- SpringBoot 3.4.5

### 3.2 Non Functional Requirements 

#### 3.2.1 Performance
- NFR0: Songs will load in less than 3 seconds.
- NFR1: The customer will be able to download songs in less than 30 seconds.
- NFR2: The artist will be able to upload music in less than 1 minute.
- NFR3: The artist will be able to view their song's engagement in less than 5 seconds.

#### 3.2.2 Security
- NFR4: The system is going to be available only to authorized users, using their username and password.

#### 3.2.3 Reliability

#### 3.2.4 Availability
- NFR5: The Music Subscription Service system shall be available 24/7. Scheduled Maintenance should be initialized during scheduled low activity hours such as federal holidays to minimize conflict with user's using the app.

#### 3.2.5 Compliance

#### 3.2.6 Cost
There will be no monetary cost for the software product.

#### 3.2.7 Deadline
June 18, 2025
