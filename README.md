# CS564 Capstone Project

#### Usage:

To Start the vulnerable application:

```
docker compose up vulnerable-application --build
```

To start the C2 server:

```
docker compose up c2 --build
```

To start the exploit.

```
docker compose up initial_exploit --build
```

### Architectural Diagram

```mermaid
graph TB
    subgraph "CS564 Capstone - Security Demonstration Project"
        subgraph "Attack Infrastructure"
            IE[Initial Exploit<br/>Docker Container]
            C2[C2 Server<br/>Command & Control<br/>Docker Container]
        end
        
        subgraph "Target System"
            VA[Vulnerable Application<br/>Docker Container<br/>Java/Python/C Components]
        end
        
        subgraph "Deployment & Orchestration"
            DC[Docker Compose<br/>docker-compose.yml]
        end
        
        subgraph "Data & Artifacts"
            ENC[Encrypted Files<br/>file.enc]
            TXT[Text Files<br/>file.txt, t.txt, t2.txt]
        end
    end
    
    %% Relationships
    DC -->|Builds & Runs| IE
    DC -->|Builds & Runs| C2
    DC -->|Builds & Runs| VA
    
    IE -->|1. Exploits Vulnerability| VA
    IE -->|2. Establishes Connection| C2
    VA -->|3. Compromised Connection| C2
    C2 -->|4. Command & Control| VA
    
    VA -.->|Accesses/Manipulates| ENC
    VA -.->|Reads/Writes| TXT
    
    %% Styling
    classDef attackNode fill:#ff6b6b,stroke:#c92a2a,stroke-width:2px,color:#fff
    classDef targetNode fill:#4dabf7,stroke:#1971c2,stroke-width:2px,color:#fff
    classDef infraNode fill:#51cf66,stroke:#2f9e44,stroke-width:2px,color:#fff
    classDef dataNode fill:#ffd43b,stroke:#f59f00,stroke-width:2px,color:#000
    
    class IE,C2 attackNode
    class VA targetNode
    class DC infraNode
    class ENC,TXT dataNode

```
