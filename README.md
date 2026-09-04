For this Election Voting project only, we'll keep the architecture simple:

Ruby on Rails 8 — both backend and frontend
ERB
Hotwire / Turbo
Stimulus
PostgreSQL
Puma
Redis when we reach the point where it's useful
Sidekiq for background jobs when needed
Turbo Streams + Action Cable for realtime results
No React
No Angular
No separate frontend/backend projects
No RabbitMQ unless we later discover a genuine reason for it
🗳️ Election Voting System — Milestones

# Milestone 1 — Rails Project Foundation
Create Rails 8 application
Configure PostgreSQL
Configure Docker / Docker Compose
Configure development environment
Configure environment variables
Verify Rails ↔ PostgreSQL connection
Set up application layout
Set up basic styling
Create home page
Add health check

# Milestone 2 — User Authentication
Install Devise
Create User model
Implement registration
Implement login
Implement logout
Protect authenticated pages
Display current user
Handle authentication errors

# Milestone 3 — Election
Create Election model
Define election attributes
Create election
Edit election
Delete election
Add election start time
Add election end time
Implement election status
Display election information

Example:

Election 2026

Status: OPEN
Start:  10:00
End:    18:00

# Milestone 4 — Candidates
Create Candidate model
Define Election → Candidates relationship
Create candidate
Edit candidate
Delete candidate
Add candidate information
Display candidates
Associate candidates with an election

Example:

Election 2026

John Wick
Jane Doe
Bob Smith

# Milestone 5 — Voting System

This is the core functionality.

Create Vote model
Define User → Votes relationship
Define Election → Votes relationship
Define Candidate → Votes relationship
Implement voting
Validate authenticated user
Validate election status
Validate candidate belongs to election
Prevent voting before election starts
Prevent voting after election ends
Prevent duplicate voting
Add database unique constraint
Add database indexes
Handle concurrent voting
Use database transactions where appropriate

The fundamental rule:

One User
   +
One Election
   ↓
One Vote

# Milestone 6 — Voting Page & UX
Create election voting page
Display candidate list
Add Vote button
Add vote confirmation
Show successful vote message
Show duplicate vote message
Disable voting after successful vote
Display current user's voting status
Handle voting errors
Improve voting page UX

Target:

Election 2026

┌─────────────────────────────┐
│ John Wick                   │
│ Candidate A                 │
│                             │
│              [ VOTE ]       │
└─────────────────────────────┘

┌─────────────────────────────┐
│ Jane Doe                    │
│ Candidate B                 │
│                             │
│              [ VOTE ]       │
└─────────────────────────────┘


# Milestone 7 — Vote Results
Calculate candidate vote counts
Calculate total votes
Calculate vote percentages
Display candidate rankings
Display election statistics
Optimize vote-count queries
Add appropriate database indexes
Analyze query performance

Example:

Election Results

John Wick     4,321 votes   43.2%
Jane Doe      3,512 votes   35.1%
Bob Smith     2,167 votes   21.7%

Total votes: 10,000


# Milestone 8 — Realtime Results with Turbo Streams

Introduce realtime functionality.

Configure Turbo Streams
Configure Action Cable
Create election result stream
Broadcast vote result changes
Update candidate vote counts without page refresh
Update rankings in realtime
Update percentages in realtime
Test multiple connected browsers
Test concurrent voting
Evaluate realtime broadcast frequency

Target:

User A votes
     ↓
PostgreSQL
     ↓
Vote committed
     ↓
Turbo Stream
     ↓
┌────┼────┬────┐
↓    ↓    ↓    ↓
A    B    C    D

Everyone sees the result change automatically.

# Milestone 9 — Redis
Introduce Redis only when we have a reason to use it.

Add Redis
Configure Redis
Implement election-result caching
Implement cache invalidation
Implement rate limiting
Evaluate Redis for Action Cable
Test Redis under concurrent traffic
Compare performance with/without Redis

# Milestone 10 — Background Jobs with Sidekiq
Add Sidekiq
Configure Redis for Sidekiq
Create background job
Add vote confirmation job
Add audit/analytics job
Handle failed jobs
Monitor job queues
Determine which operations should/shouldn't be asynchronous

The actual vote remains:

User
 ↓
Rails
 ↓
PostgreSQL
 ↓
Vote committed

Background processing is for secondary work.

# Milestone 11 — Production Setup
Configure Rails production environment
Configure PostgreSQL production settings
Configure Redis production settings
Configure Puma
Configure reverse proxy/load balancer
Configure HTTPS
Configure environment variables
Configure production logging
Configure health checks
Configure graceful shutdown

# Milestone 12 — Load Testing
Now we test the original goal: 10K users voting at approximately the same time.

Create realistic voting load test
Test 100 concurrent users
Test 1,000 concurrent users
Test 5,000 concurrent users
Test 10,000 concurrent users
Measure requests/sec
Measure response time
Measure Rails/Puma performance
Measure PostgreSQL performance
Measure database connections
Measure Redis performance
Measure Action Cable connections
Identify bottlenecks
Optimize based on measurements

# Milestone 13 — Concurrency & Failure Testing
Test duplicate simultaneous votes
Test multiple users voting for the same candidate
Test 10K simultaneous votes
Test database connection exhaustion
Test Rails instance failure
Test Redis failure
Test Sidekiq failure
Test Action Cable failure
Test duplicate HTTP requests
Verify vote integrity after failures

The ultimate requirement:

10,000 simultaneous voting attempts
                 ↓
             PostgreSQL
                 ↓
        Correct vote records
                 ↓
       Correct election result

# Milestone 14 — Observability & Optimization
Improve Rails logging
Monitor request latency
Monitor database queries
Identify slow queries
Analyze PostgreSQL indexes
Monitor Puma
Monitor Redis
Monitor Sidekiq
Monitor Action Cable
Establish performance baseline
Optimize bottlenecks
Re-run 10K load test
Final Project Progression
