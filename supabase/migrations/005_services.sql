create type service_type as enum (
  'reception',
  'dinner'
);

create table public.services (
  id uuid primary key default gen_random_uuid(),

  business_id uuid not null
    references public.provider_businesses(id)
    on delete cascade,

  service_type service_type not null,

  title text not null,

  description text,

  active boolean not null default true,

  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.services
enable row level security;
