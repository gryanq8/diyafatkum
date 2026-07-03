create type business_type as enum (
  'company',
  'establishment',
  'home_business',
  'individual',
  'other'
);

create type accreditation_status as enum (
  'pending',
  'approved',
  'rejected',
  'suspended'
);

create table public.provider_businesses (
  id uuid primary key default gen_random_uuid(),

  provider_id uuid not null references public.profiles(id) on delete cascade,

  business_name text not null,
  business_type business_type not null default 'individual',
  description text,
  logo_url text,

  phone text,
  whatsapp text,
  email text,
  instagram text,

  service_all_kuwait boolean not null default true,
  service_areas text[] default '{}',

  license_number text,
  license_issuer text,
  license_issue_date date,
  license_expiry_date date,

  accreditation_status accreditation_status not null default 'pending',
  rejection_reason text,
  admin_notes text,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.provider_businesses
enable row level security;
