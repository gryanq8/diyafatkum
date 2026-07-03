create type request_status as enum (
  'pending',
  'accepted',
  'rejected',
  'cancelled',
  'completed'
);

create table public.requests (
  id uuid primary key default gen_random_uuid(),

  customer_id uuid not null
    references public.profiles(id)
    on delete cascade,

  business_id uuid not null
    references public.provider_businesses(id)
    on delete cascade,

  package_id uuid
    references public.packages(id)
    on delete set null,

  address_id uuid
    references public.customer_addresses(id)
    on delete set null,

  event_date date not null,

  guest_count integer,

  total_price numeric(10,3),

  customer_notes text,

  provider_notes text,

  status request_status not null default 'pending',

  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.requests
enable row level security;
