;; Farm Registration Contract
;; Records details of participating agricultural operations

(define-data-var admin principal tx-sender)

;; Farm data structure
(define-map farms
  { farm-id: uint }
  {
    owner: principal,
    name: (string-ascii 100),
    location: (string-ascii 100),
    size: uint,
    crop-types: (list 10 (string-ascii 50)),
    registration-date: uint
  }
)

;; Counter for farm IDs
(define-data-var farm-id-counter uint u1)

;; Check if caller is admin
(define-private (is-admin)
  (is-eq tx-sender (var-get admin))
)

;; Register a new farm
(define-public (register-farm
    (name (string-ascii 100))
    (location (string-ascii 100))
    (size uint)
    (crop-types (list 10 (string-ascii 50))))
  (let
    (
      (farm-id (var-get farm-id-counter))
    )
    (asserts! (> (len crop-types) u0) (err u1)) ;; Must have at least one crop type
    (asserts! (> size u0) (err u2)) ;; Size must be greater than 0

    ;; Add farm to map
    (map-set farms
      { farm-id: farm-id }
      {
        owner: tx-sender,
        name: name,
        location: location,
        size: size,
        crop-types: crop-types,
        registration-date: block-height
      }
    )

    ;; Increment farm ID counter
    (var-set farm-id-counter (+ farm-id u1))

    (ok farm-id)
  )
)

;; Update farm details (only farm owner)
(define-public (update-farm
    (farm-id uint)
    (name (string-ascii 100))
    (location (string-ascii 100))
    (size uint)
    (crop-types (list 10 (string-ascii 50))))
  (let
    (
      (farm-data (unwrap! (map-get? farms { farm-id: farm-id }) (err u3)))
    )
    ;; Check if caller is farm owner
    (asserts! (is-eq tx-sender (get owner farm-data)) (err u4))
    (asserts! (> (len crop-types) u0) (err u1))
    (asserts! (> size u0) (err u2))

    ;; Update farm data
    (map-set farms
      { farm-id: farm-id }
      {
        owner: tx-sender,
        name: name,
        location: location,
        size: size,
        crop-types: crop-types,
        registration-date: (get registration-date farm-data)
      }
    )

    (ok true)
  )
)

;; Get farm details
(define-read-only (get-farm (farm-id uint))
  (map-get? farms { farm-id: farm-id })
)

;; Check if farm exists
(define-read-only (farm-exists (farm-id uint))
  (is-some (map-get? farms { farm-id: farm-id }))
)

;; Set new admin (only current admin)
(define-public (set-admin (new-admin principal))
  (begin
    (asserts! (is-admin) (err u5))
    (var-set admin new-admin)
    (ok true)
  )
)
