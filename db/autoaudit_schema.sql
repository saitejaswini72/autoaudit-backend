-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role VARCHAR(50) DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tenants table (company being audited)
CREATE TABLE tenants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    domain VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Audit Runs (each scan instance)
CREATE TABLE audit_runs (
    id SERIAL PRIMARY KEY,
    tenant_id INT REFERENCES tenants(id) ON DELETE CASCADE,
    run_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'in_progress'
);

-- Audit Findings (issues found in each run)
CREATE TABLE audit_findings (
    id SERIAL PRIMARY KEY,
    audit_run_id INT REFERENCES audit_runs(id) ON DELETE CASCADE,
    check_name VARCHAR(200),
    result VARCHAR(50), -- e.g. PASS/FAIL
    severity VARCHAR(50),
    details TEXT
);

-- Reports (summary of each run)
CREATE TABLE reports (
    id SERIAL PRIMARY KEY,
    audit_run_id INT REFERENCES audit_runs(id) ON DELETE CASCADE,
    compliance_score INT,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
