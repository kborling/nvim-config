local status, org = pcall(require, "orgmode")
if (not status) then return end

org.setup({
    org_agenda_files = { '~/org/**/*' },
    org_default_notes_file = '~/org/refile.org',
})
