create type document_type as enum (
  'commercial_license',
  'municipality_license',
  'civil_id',
  'other'
);

create table public.provider_documents (
  id uuid primary key default gen_random_uuid(),

  business_id uuid not null
    references public.provider_businesses(id)
    on delete cascade,

  document_type document_type not null default 'other',

  file_name text not null,
  file_url text not null,

  uploaded_at timestamptz default now()
);

alter table public.provider_documents
enable row level security;
