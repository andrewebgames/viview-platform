-- ViView Platform - Database Schema
-- PostgreSQL 14+

-- Tenants
CREATE TABLE IF NOT EXISTS tenants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255),
    nome_empresa VARCHAR(255) NOT NULL,
    email_contato VARCHAR(255) NOT NULL,
    logo_url TEXT,
    cor_primaria VARCHAR(7) DEFAULT '#0A4D5C',
    cor_secundaria VARCHAR(7) DEFAULT '#17A398',
    status VARCHAR(50) DEFAULT 'ativo'
);

-- Users
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14),
    cargo VARCHAR(50) DEFAULT 'user',
    role VARCHAR(50) DEFAULT 'user',
    tenant_id UUID REFERENCES tenants(id),
    ativo BOOLEAN DEFAULT true
);

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_tenant ON users(tenant_id);

-- Mais 16 tabelas seguindo o mesmo padrão...
-- (Consulte documentação completa)
