// Minimal JS to toggle mobile header navigation
document.addEventListener('DOMContentLoaded', function () {
    var btn = document.querySelector('.nav-toggle');
    var nav = document.getElementById('site-nav');
    if (!btn || !nav) return;
    btn.addEventListener('click', function () {
        var expanded = btn.getAttribute('aria-expanded') === 'true';
        btn.setAttribute('aria-expanded', String(!expanded));
        if (expanded) {
            nav.setAttribute('hidden', '');
            document.documentElement.classList.remove('nav-open');
            btn.setAttribute('aria-label', 'Open navigation');
        } else {
            nav.removeAttribute('hidden');
            document.documentElement.classList.add('nav-open');
            btn.setAttribute('aria-label', 'Close navigation');
        }
    });
    // Close menu when a nav link is clicked (useful on mobile)
    nav.querySelectorAll('a').forEach(function (link) {
        link.addEventListener('click', function () {
            if (window.innerWidth <= 640) {
                nav.setAttribute('hidden', '');
                btn.setAttribute('aria-expanded', 'false');
                document.documentElement.classList.remove('nav-open');
                btn.setAttribute('aria-label', 'Open navigation');
            }
        })
    });

    // Theme toggle
    var themeBtn = document.querySelector('.theme-toggle');
    if (themeBtn) {
        var applyTheme = function (theme) {
            if (theme === 'dark') {
                document.documentElement.setAttribute('data-theme', 'dark');
                themeBtn.setAttribute('aria-pressed', 'true');
            } else {
                document.documentElement.removeAttribute('data-theme');
                themeBtn.setAttribute('aria-pressed', 'false');
            }
        };

        // initialize from localStorage or system preference
        var stored = null;
        try { stored = localStorage.getItem('site-theme'); } catch (e) { }
        if (stored) { applyTheme(stored); }
        else if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) { applyTheme('dark'); }

        themeBtn.addEventListener('click', function () {
            var isDark = document.documentElement.getAttribute('data-theme') === 'dark';
            var next = isDark ? 'light' : 'dark';
            applyTheme(next === 'dark' ? 'dark' : 'light');
            try { localStorage.setItem('site-theme', next === 'dark' ? 'dark' : 'light'); } catch (e) { }
        });
    }
});
