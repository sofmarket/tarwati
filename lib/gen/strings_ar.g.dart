///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsAr = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsValidationAr validation = TranslationsValidationAr.internal(_root);
	late final TranslationsAttributesAr attributes = TranslationsAttributesAr.internal(_root);
	late final TranslationsExceptionsAr exceptions = TranslationsExceptionsAr.internal(_root);
	late final TranslationsDateAr date = TranslationsDateAr.internal(_root);

	/// ar: 'Pas de connexion Internet'
	String get noInternetConnection => 'Pas de connexion Internet';

	/// ar: 'Veuillez vérifier votre connexion Internet et réessayer'
	String get checkInternetAndRetry => 'Veuillez vérifier votre connexion Internet et réessayer';
}

// Path: validation
class TranslationsValidationAr {
	TranslationsValidationAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Veuillez remplir ce champ'
	String get required => 'Veuillez remplir ce champ';

	/// ar: 'Veuillez entrer le numéro de téléphone'
	String get phoneRequired => 'Veuillez entrer le numéro de téléphone';

	/// ar: 'Numéro de téléphone invalide'
	String get phoneInvalid => 'Numéro de téléphone invalide';

	/// ar: 'Veuillez entrer l'e-mail'
	String get emailRequired => 'Veuillez entrer l\'e-mail';

	/// ar: 'E-mail invalide'
	String get emailInvalid => 'E-mail invalide';

	/// ar: 'Veuillez entrer le mot de passe'
	String get passwordRequired => 'Veuillez entrer le mot de passe';

	/// ar: 'Veuillez confirmer le mot de passe'
	String get passwordConfirmationRequired => 'Veuillez confirmer le mot de passe';

	/// ar: 'Les mots de passe ne correspondent pas'
	String get passwordConfirmationNotMatch => 'Les mots de passe ne correspondent pas';

	/// ar: 'Code d'activation invalide'
	String get otpInvalid => 'Code d\'activation invalide';

	/// ar: 'Veuillez entrer le nom'
	String get nameRequired => 'Veuillez entrer le nom';

	/// ar: 'Le commentaire doit contenir au moins 10 caractères'
	String get mustBeAtLeast10Characters => 'Le commentaire doit contenir au moins 10 caractères';

	/// ar: 'Erreur de validation'
	String get apiErrorTitle => 'Erreur de validation';
}

// Path: attributes
class TranslationsAttributesAr {
	TranslationsAttributesAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Prénom'
	String get firstName => 'Prénom';

	/// ar: 'Nom de famille'
	String get lastName => 'Nom de famille';

	/// ar: 'E-mail'
	String get email => 'E-mail';

	/// ar: 'Nom complet'
	String get fullName => 'Nom complet';

	/// ar: 'Téléphone'
	String get phone => 'Téléphone';

	/// ar: 'Code pays'
	String get countryCode => 'Code pays';

	/// ar: 'Photo de profil'
	String get profilePicture => 'Photo de profil';

	/// ar: 'Sexe'
	String get gender => 'Sexe';

	/// ar: 'Date de naissance'
	String get dateOfBirth => 'Date de naissance';

	/// ar: 'Adresse'
	String get address => 'Adresse';

	/// ar: 'Ville'
	String get city => 'Ville';

	/// ar: 'Code postal'
	String get zipCode => 'Code postal';
}

// Path: exceptions
class TranslationsExceptionsAr {
	TranslationsExceptionsAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsExceptionsUnknownAr unknown = TranslationsExceptionsUnknownAr.internal(_root);
	late final TranslationsExceptionsNetworkAr network = TranslationsExceptionsNetworkAr.internal(_root);
	late final TranslationsExceptionsServerAr server = TranslationsExceptionsServerAr.internal(_root);
	late final TranslationsExceptionsTimeoutAr timeout = TranslationsExceptionsTimeoutAr.internal(_root);
	late final TranslationsExceptionsCustomAr custom = TranslationsExceptionsCustomAr.internal(_root);
	late final TranslationsExceptionsAppointmentNotInProgressAr appointmentNotInProgress = TranslationsExceptionsAppointmentNotInProgressAr.internal(_root);
	late final TranslationsExceptionsPaymentFailedAr paymentFailed = TranslationsExceptionsPaymentFailedAr.internal(_root);
	late final TranslationsExceptionsPermissionDeniedAr permissionDenied = TranslationsExceptionsPermissionDeniedAr.internal(_root);
	late final TranslationsExceptionsMaintenanceAr maintenance = TranslationsExceptionsMaintenanceAr.internal(_root);
}

// Path: date
class TranslationsDateAr {
	TranslationsDateAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Aujourd'hui'
	String get today => 'Aujourd\'hui';

	/// ar: 'Hier'
	String get yesterday => 'Hier';

	/// ar: 'Demain'
	String get tomorrow => 'Demain';

	/// ar: 'Avant-hier'
	String get beforeYesterday => 'Avant-hier';
}

// Path: exceptions.unknown
class TranslationsExceptionsUnknownAr {
	TranslationsExceptionsUnknownAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Erreur'
	String get title => 'Erreur';

	/// ar: 'Une erreur s'est produite'
	String get message => 'Une erreur s\'est produite';
}

// Path: exceptions.network
class TranslationsExceptionsNetworkAr {
	TranslationsExceptionsNetworkAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Problème réseau'
	String get title => 'Problème réseau';

	/// ar: 'Veuillez vérifier votre connexion Internet'
	String get message => 'Veuillez vérifier votre connexion Internet';
}

// Path: exceptions.server
class TranslationsExceptionsServerAr {
	TranslationsExceptionsServerAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Erreur'
	String get title => 'Erreur';

	/// ar: 'Veuillez réessayer plus tard'
	String get message => 'Veuillez réessayer plus tard';
}

// Path: exceptions.timeout
class TranslationsExceptionsTimeoutAr {
	TranslationsExceptionsTimeoutAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Erreur'
	String get title => 'Erreur';

	/// ar: 'Une erreur s'est produite. Veuillez réessayer plus tard'
	String get message => 'Une erreur s\'est produite. Veuillez réessayer plus tard';
}

// Path: exceptions.custom
class TranslationsExceptionsCustomAr {
	TranslationsExceptionsCustomAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Erreur'
	String get title => 'Erreur';

	/// ar: 'Une erreur s'est produite'
	String get message => 'Une erreur s\'est produite';
}

// Path: exceptions.appointmentNotInProgress
class TranslationsExceptionsAppointmentNotInProgressAr {
	TranslationsExceptionsAppointmentNotInProgressAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Appel vidéo non disponible'
	String get title => 'Appel vidéo non disponible';

	/// ar: 'Ce rendez-vous n'est pas en cours actuellement. Vous ne pouvez rejoindre l'appel vidéo que pendant l'heure du rendez-vous prévu. Veuillez vérifier les détails de votre rendez-vous et réessayer au bon moment.'
	String get message => 'Ce rendez-vous n\'est pas en cours actuellement. Vous ne pouvez rejoindre l\'appel vidéo que pendant l\'heure du rendez-vous prévu. Veuillez vérifier les détails de votre rendez-vous et réessayer au bon moment.';
}

// Path: exceptions.paymentFailed
class TranslationsExceptionsPaymentFailedAr {
	TranslationsExceptionsPaymentFailedAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Échec du paiement'
	String get title => 'Échec du paiement';

	/// ar: 'Le paiement a échoué. Veuillez réessayer plus tard'
	String get message => 'Le paiement a échoué. Veuillez réessayer plus tard';
}

// Path: exceptions.permissionDenied
class TranslationsExceptionsPermissionDeniedAr {
	TranslationsExceptionsPermissionDeniedAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Permission refusée'
	String get title => 'Permission refusée';

	/// ar: 'Accès refusé. Vous n'avez pas la permission d'effectuer cette action.'
	String get message => 'Accès refusé. Vous n\'avez pas la permission d\'effectuer cette action.';
}

// Path: exceptions.maintenance
class TranslationsExceptionsMaintenanceAr {
	TranslationsExceptionsMaintenanceAr.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'Maintenance'
	String get title => 'Maintenance';

	/// ar: 'Le système est actuellement en maintenance. Veuillez réessayer plus tard.'
	String get message => 'Le système est actuellement en maintenance. Veuillez réessayer plus tard.';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'validation.required' => 'Veuillez remplir ce champ',
			'validation.phoneRequired' => 'Veuillez entrer le numéro de téléphone',
			'validation.phoneInvalid' => 'Numéro de téléphone invalide',
			'validation.emailRequired' => 'Veuillez entrer l\'e-mail',
			'validation.emailInvalid' => 'E-mail invalide',
			'validation.passwordRequired' => 'Veuillez entrer le mot de passe',
			'validation.passwordConfirmationRequired' => 'Veuillez confirmer le mot de passe',
			'validation.passwordConfirmationNotMatch' => 'Les mots de passe ne correspondent pas',
			'validation.otpInvalid' => 'Code d\'activation invalide',
			'validation.nameRequired' => 'Veuillez entrer le nom',
			'validation.mustBeAtLeast10Characters' => 'Le commentaire doit contenir au moins 10 caractères',
			'validation.apiErrorTitle' => 'Erreur de validation',
			'attributes.firstName' => 'Prénom',
			'attributes.lastName' => 'Nom de famille',
			'attributes.email' => 'E-mail',
			'attributes.fullName' => 'Nom complet',
			'attributes.phone' => 'Téléphone',
			'attributes.countryCode' => 'Code pays',
			'attributes.profilePicture' => 'Photo de profil',
			'attributes.gender' => 'Sexe',
			'attributes.dateOfBirth' => 'Date de naissance',
			'attributes.address' => 'Adresse',
			'attributes.city' => 'Ville',
			'attributes.zipCode' => 'Code postal',
			'exceptions.unknown.title' => 'Erreur',
			'exceptions.unknown.message' => 'Une erreur s\'est produite',
			'exceptions.network.title' => 'Problème réseau',
			'exceptions.network.message' => 'Veuillez vérifier votre connexion Internet',
			'exceptions.server.title' => 'Erreur',
			'exceptions.server.message' => 'Veuillez réessayer plus tard',
			'exceptions.timeout.title' => 'Erreur',
			'exceptions.timeout.message' => 'Une erreur s\'est produite. Veuillez réessayer plus tard',
			'exceptions.custom.title' => 'Erreur',
			'exceptions.custom.message' => 'Une erreur s\'est produite',
			'exceptions.appointmentNotInProgress.title' => 'Appel vidéo non disponible',
			'exceptions.appointmentNotInProgress.message' => 'Ce rendez-vous n\'est pas en cours actuellement. Vous ne pouvez rejoindre l\'appel vidéo que pendant l\'heure du rendez-vous prévu. Veuillez vérifier les détails de votre rendez-vous et réessayer au bon moment.',
			'exceptions.paymentFailed.title' => 'Échec du paiement',
			'exceptions.paymentFailed.message' => 'Le paiement a échoué. Veuillez réessayer plus tard',
			'exceptions.permissionDenied.title' => 'Permission refusée',
			'exceptions.permissionDenied.message' => 'Accès refusé. Vous n\'avez pas la permission d\'effectuer cette action.',
			'exceptions.maintenance.title' => 'Maintenance',
			'exceptions.maintenance.message' => 'Le système est actuellement en maintenance. Veuillez réessayer plus tard.',
			'date.today' => 'Aujourd\'hui',
			'date.yesterday' => 'Hier',
			'date.tomorrow' => 'Demain',
			'date.beforeYesterday' => 'Avant-hier',
			'noInternetConnection' => 'Pas de connexion Internet',
			'checkInternetAndRetry' => 'Veuillez vérifier votre connexion Internet et réessayer',
			_ => null,
		};
	}
}
