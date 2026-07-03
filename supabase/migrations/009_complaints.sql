create type complaint_status as enum (
  'open',
  'under_review',
  'resolved',
  'closed'
);

create table public.complaints (
  id uuid primary key default gen_random_uuid(),

  request_id uuid
    references public.requests(id)
    on delete set null,

  customer_id uuid
    references public.profiles(id)
    on delete set null,

  business_id uuid
    references public.provider_businesses(id)
    on delete set null,

  subject text not null,

  complaint text not null,

  manager_reply text,

  status complaint_status default 'open',

  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.complaints
enable row level security;
