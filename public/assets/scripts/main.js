/* ============================================================
   RE-BUILD TECH — main.js
   Navegación de anclas + módulo RBT (datos simulados + UI helpers)
   ============================================================ */

/* ---------- Menú: scroll a secciones (código original) ---------- */
const inicio = document.querySelector('a[href="#inicio"]')
const nosotros = document.querySelector('a[href="#nosotros"]')
const impacto = document.querySelector('a[href="#impacto"]')
const contacto = document.querySelector('a[href="#contacto"]')

inicio?.addEventListener("click", (i) => {
    i.preventDefault();
    document.querySelector("#inicio")?.scrollIntoView({behavior: "smooth"})
})
nosotros?.addEventListener("click", (n) => {
    n.preventDefault();
    document.querySelector("#nosotros")?.scrollIntoView({behavior: "smooth"})
})
impacto?.addEventListener("click", (im) => {
    im.preventDefault();
    document.querySelector("#impacto")?.scrollIntoView({behavior: "smooth"})
})
contacto?.addEventListener("click", (c) => {
    c.preventDefault();
    document.querySelector("#contacto")?.scrollIntoView({behavior: "smooth"})
})

/* ============================================================
   RBT — capa de datos simulada (localStorage) + utilidades UI
   Toda la app lee/escribe aquí en lugar de tener datos sueltos
   en cada página. Esto imita una base de datos real para poder
   demostrar cada historia de usuario sin backend.
   ============================================================ */
const RBT = (() => {

    const KEYS = {
        SESSION: "rbt_session",
        MATERIALES: "rbt_materiales",
        OBRAS: "rbt_obras",
        MATCHES: "rbt_matches",
        MIEMBROS: "rbt_miembros",
        LOG: "rbt_log",
        METRICS: "rbt_metrics",
        DRAFT: "rbt_draft_"
    };

    function read(key, fallback) {
        try {
            const raw = localStorage.getItem(key);
            return raw ? JSON.parse(raw) : fallback;
        } catch (e) {
            return fallback;
        }
    }
    function write(key, value) {
        localStorage.setItem(key, JSON.stringify(value));
    }
    function uid(prefix) {
        return prefix + "-" + Math.random().toString(36).slice(2, 7).toUpperCase();
    }
    function nowLabel() {
        return new Date().toLocaleString("es-PE", { day: "2-digit", month: "short", hour: "2-digit", minute: "2-digit" });
    }

    /* ---------- Semilla inicial (solo si no existe aún) ---------- */
    function seed() {
        if (!localStorage.getItem(KEYS.OBRAS)) {
            write(KEYS.OBRAS, [
                { id: "OB-01", nombre: "Obra San Borja", distrito: "San Borja", responsable: "Constructora Andina" },
                { id: "OB-02", nombre: "Obra La Molina", distrito: "La Molina", responsable: "Grupo Cimiento" },
                { id: "OB-03", nombre: "Obra San Isidro", distrito: "San Isidro", responsable: "Constructora Andina" }
            ]);
        }
        if (!localStorage.getItem(KEYS.MATERIALES)) {
            write(KEYS.MATERIALES, [
                { id: uid("MAT"), tipo: "Concreto triturado", categoria: "Hormigón", volumen: "12 m3", distrito: "San Borja", obraId: "OB-01", co2: 0.6, distanciaKm: 3.1, estado: "Disponible", lat: -12.110, lng: -77.035 },
                { id: uid("MAT"), tipo: "Ladrillos reutilizables", categoria: "Ladrillo", volumen: "500 und", distrito: "La Molina", obraId: "OB-02", co2: 0.4, distanciaKm: 1.2, estado: "Disponible", lat: -12.095, lng: -77.015 },
                { id: uid("MAT"), tipo: "Metal recuperado", categoria: "Metal", volumen: "280 kg", distrito: "San Isidro", obraId: "OB-03", co2: 1.1, distanciaKm: 2.8, estado: "Disponible", lat: -12.085, lng: -77.040 }
            ]);
        }
        if (!localStorage.getItem(KEYS.MATCHES)) write(KEYS.MATCHES, []);
        if (!localStorage.getItem(KEYS.MIEMBROS)) {
            write(KEYS.MIEMBROS, [{ id: uid("USR"), correo: "admin@rebuildtech.com", rol: "Administrador" }]);
        }
        if (!localStorage.getItem(KEYS.LOG)) write(KEYS.LOG, []);
    }
    seed();

    /* ---------- Sesión / rol ---------- */
    const session = {
        get() { return read(KEYS.SESSION, null); },
        start(data) {
            const s = { ...data, iniciadaEn: Date.now() };
            write(KEYS.SESSION, s);
            return s;
        },
        setRol(rol) {
            const s = session.get() || {};
            s.rol = rol;
            write(KEYS.SESSION, s);
        },
        end() { localStorage.removeItem(KEYS.SESSION); }
    };

    /* ---------- Materiales / Obras / Miembros / Matches ---------- */
    const materiales = {
        all() { return read(KEYS.MATERIALES, []); },
        save(list) { write(KEYS.MATERIALES, list); },
        add(item) {
            const list = materiales.all();
            list.unshift({ id: uid("MAT"), estado: "Disponible", ...item });
            materiales.save(list);
            log("Publicación de material", item.tipo || "");
        },
        update(id, patch) {
            materiales.save(materiales.all().map(m => m.id === id ? { ...m, ...patch } : m));
            log("Edición de material", id);
        },
        remove(id) {
            materiales.save(materiales.all().filter(m => m.id !== id));
            log("Baja de material", id);
        }
    };

    const obras = {
        all() { return read(KEYS.OBRAS, []); },
        add(item) {
            const list = obras.all();
            list.unshift({ id: uid("OB"), ...item });
            write(KEYS.OBRAS, list);
            log("Registro de obra", item.nombre || "");
        }
    };

    const miembros = {
        all() { return read(KEYS.MIEMBROS, []); },
        add(correo, rol) {
            const list = miembros.all();
            list.push({ id: uid("USR"), correo, rol: rol || "Miembro" });
            write(KEYS.MIEMBROS, list);
            log("Nuevo miembro agregado", correo);
        }
    };

    const matches = {
        all() { return read(KEYS.MATCHES, []); },
        save(list) { write(KEYS.MATCHES, list); },
        add(materialId, materialNombre) {
            const list = matches.all();
            list.unshift({
                id: uid("MTC"), materialId, materialNombre,
                estado: "Solicitado", creadoEn: nowLabel(),
                mensajes: [], calificacion: null, evidencia: false, recojo: null
            });
            matches.save(list);
            log("Solicitud de match", materialNombre);
        },
        setEstado(id, estado) {
            matches.save(matches.all().map(m => m.id === id ? { ...m, estado } : m));
            log("Cambio de estado de match", id + " -> " + estado);
        }
    };

    function log(accion, detalle) {
        const list = read(KEYS.LOG, []);
        list.unshift({ accion, detalle, fecha: nowLabel() });
        write(KEYS.LOG, list.slice(0, 100));
    }

    /* ---------- Toasts ---------- */
    function ensureToastHost() {
        let host = document.querySelector(".rbt-toast-host");
        if (!host) {
            host = document.createElement("div");
            host.className = "rbt-toast-host";
            document.body.appendChild(host);
        }
        return host;
    }
    function toast(message, type = "success") {
        const host = ensureToastHost();
        const el = document.createElement("div");
        el.className = `rbt-toast rbt-toast--${type}`;
        el.innerHTML = `<span class="rbt-toast-dot"></span><span>${message}</span>`;
        host.appendChild(el);
        requestAnimationFrame(() => el.classList.add("rbt-toast--visible"));
        setTimeout(() => {
            el.classList.remove("rbt-toast--visible");
            setTimeout(() => el.remove(), 250);
        }, 3200);
    }

    /* ---------- Modal genérico ---------- */
    function openModal(innerHtml) {
        closeModal();
        const overlay = document.createElement("div");
        overlay.className = "rbt-modal-overlay";
        overlay.innerHTML = `<div class="rbt-modal">${innerHtml}</div>`;
        overlay.addEventListener("click", (e) => { if (e.target === overlay) closeModal(); });
        document.body.appendChild(overlay);
        requestAnimationFrame(() => overlay.classList.add("rbt-modal-overlay--visible"));
        return overlay;
    }
    function closeModal() {
        document.querySelectorAll(".rbt-modal-overlay").forEach(o => o.remove());
    }

    /* ---------- Validación de formularios ---------- */
    function markError(input, message) {
        input.classList.add("rbt-input-error");
        let hint = input.parentElement.querySelector(".rbt-field-error");
        if (!hint) {
            hint = document.createElement("small");
            hint.className = "rbt-field-error";
            input.insertAdjacentElement("afterend", hint);
        }
        hint.textContent = message;
    }
    function clearError(input) {
        input.classList.remove("rbt-input-error");
        const hint = input.parentElement.querySelector(".rbt-field-error");
        if (hint) hint.remove();
    }

    /* ---------- Métricas ambientales (US-020, 029, 031, 032, 038) ---------- */
    function totalesActuales() {
        const mats = materiales.all();
        const entregados = matches.all().filter(m => m.estado === "Entregado");
        const co2Total = mats.reduce((sum, m) => sum + (Number(m.co2) || 0), 0);
        const toneladas = mats.length * 1.6; // aproximación por lote registrado
        const pctReutilizado = mats.length ? Math.round((entregados.length / Math.max(mats.length, entregados.length)) * 100) : 0;
        const ahorroEconomico = mats.length * 380 + entregados.length * 250; // S/ estimado por lote/entrega
        return {
            co2Total: Math.round(co2Total * 10) / 10,
            toneladas: Math.round(toneladas * 10) / 10,
            pctReutilizado,
            matchesActivos: matches.all().filter(m => !["Entregado", "Rechazado"].includes(m.estado)).length,
            ahorroEconomico,
            entregados: entregados.length,
            totalMateriales: mats.length
        };
    }

    const metrics = {
        totales: totalesActuales,
        snapshot() {
            const list = read(KEYS.METRICS, []);
            list.unshift({ ...totalesActuales(), fecha: nowLabel() });
            write(KEYS.METRICS, list.slice(0, 50));
            return list;
        },
        historial() { return read(KEYS.METRICS, []); }
    };

    /* ---------- Autoguardado de formularios (US-042-NF, US-049-NF) ---------- */
    function autosaveAttach(draftKey, fieldIds) {
        const key = KEYS.DRAFT + draftKey;
        let t = null;
        fieldIds.forEach(id => {
            const el = document.getElementById(id);
            if (!el) return;
            el.addEventListener("input", () => {
                clearTimeout(t);
                t = setTimeout(() => {
                    const data = {};
                    fieldIds.forEach(fid => {
                        const f = document.getElementById(fid);
                        if (f) data[fid] = f.value;
                    });
                    write(key, data);
                }, 400);
            });
        });
    }
    function autosaveRestore(draftKey, fieldIds) {
        const data = read(KEYS.DRAFT + draftKey, null);
        if (!data) return false;
        let hasValue = false;
        fieldIds.forEach(fid => {
            const f = document.getElementById(fid);
            if (f && data[fid]) { f.value = data[fid]; hasValue = true; }
        });
        return hasValue;
    }
    function autosaveClear(draftKey) {
        localStorage.removeItem(KEYS.DRAFT + draftKey);
    }

    /* ---------- Conectividad intermitente (US-042-NF) ---------- */
    window.addEventListener("offline", () => toast("Sin conexión. Tus cambios se guardan localmente y no se perderán.", "warn"));
    window.addEventListener("online", () => toast("Conexión restablecida. Sincronizando cambios pendientes..."));

    /* ---------- Sesión segura: expiración por inactividad (US-047-NF) ---------- */
    function watchInactivity(idleMinutes = 8) {
        if (!session.get()) return;
        let warned = false;
        let timer = null;
        const warnMs = (idleMinutes * 60 - 30) * 1000;
        const outMs = idleMinutes * 60 * 1000;
        let warnTimer, outTimer;

        function reset() {
            warned = false;
            clearTimeout(warnTimer);
            clearTimeout(outTimer);
            warnTimer = setTimeout(() => {
                warned = true;
                toast("Tu sesión se cerrará en 30 segundos por inactividad.", "warn");
            }, warnMs);
            outTimer = setTimeout(() => {
                session.end();
                toast("Sesión cerrada por inactividad.", "error");
                setTimeout(() => { window.location.href = "login.html"; }, 800);
            }, outMs);
        }
        ["mousemove", "keydown", "click", "scroll"].forEach(evt =>
            document.addEventListener(evt, reset, { passive: true })
        );
        reset();
    }

    /* ---------- Loader breve entre vistas (US-041-NF) ---------- */
    function ensureLoaderBar() {
        let bar = document.querySelector(".rbt-loader-bar");
        if (!bar) {
            bar = document.createElement("div");
            bar.className = "rbt-loader-bar";
            document.body.appendChild(bar);
        }
        return bar;
    }
    function showLoader() {
        const bar = ensureLoaderBar();
        bar.style.transition = "none";
        bar.style.width = "0%";
        requestAnimationFrame(() => {
            bar.style.transition = "width 0.25s ease";
            bar.style.width = "70%";
        });
    }
    function hideLoader() {
        const bar = ensureLoaderBar();
        bar.style.width = "100%";
        setTimeout(() => { bar.style.transition = "opacity 0.2s ease"; bar.style.opacity = "0"; }, 150);
        setTimeout(() => { bar.style.width = "0%"; bar.style.opacity = "1"; }, 400);
    }

    return {
        KEYS, uid, nowLabel, session, materiales, obras, miembros, matches, metrics, log,
        toast, openModal, closeModal, markError, clearError,
        autosaveAttach, autosaveRestore, autosaveClear, watchInactivity, showLoader, hideLoader
    };
})();