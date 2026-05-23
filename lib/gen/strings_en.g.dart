///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsValidationEn validation = _TranslationsValidationEn._(_root);
	@override late final _TranslationsAttributesEn attributes = _TranslationsAttributesEn._(_root);
	@override late final _TranslationsExceptionsEn exceptions = _TranslationsExceptionsEn._(_root);
	@override late final _TranslationsDateEn date = _TranslationsDateEn._(_root);
	@override String get noInternetConnection => 'Pas de connexion Internet';
	@override String get checkInternetAndRetry => 'Veuillez vérifier votre connexion Internet et réessayer';
}

// Path: validation
class _TranslationsValidationEn extends TranslationsValidationAr {
	_TranslationsValidationEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get required => 'Veuillez remplir ce champ';
	@override String get phoneRequired => 'Veuillez entrer le numéro de téléphone';
	@override String get phoneInvalid => 'Numéro de téléphone invalide';
	@override String get emailRequired => 'Veuillez entrer l\'e-mail';
	@override String get emailInvalid => 'E-mail invalide';
	@override String get passwordRequired => 'Veuillez entrer le mot de passe';
	@override String get passwordConfirmationRequired => 'Veuillez confirmer le mot de passe';
	@override String get passwordConfirmationNotMatch => 'Les mots de passe ne correspondent pas';
	@override String get otpInvalid => 'Code d\'activation invalide';
	@override String get nameRequired => 'Veuillez entrer le nom';
	@override String get mustBeAtLeast10Characters => 'Le commentaire doit contenir au moins 10 caractères';
	@override String get apiErrorTitle => 'Erreur de validation';
}

// Path: attributes
class _TranslationsAttributesEn extends TranslationsAttributesAr {
	_TranslationsAttributesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get firstName => 'Prénom';
	@override String get lastName => 'Nom de famille';
	@override String get email => 'E-mail';
	@override String get fullName => 'Nom complet';
	@override String get phone => 'Téléphone';
	@override String get countryCode => 'Code pays';
	@override String get profilePicture => 'Photo de profil';
	@override String get gender => 'Sexe';
	@override String get dateOfBirth => 'Date de naissance';
	@override String get address => 'Adresse';
	@override String get city => 'Ville';
	@override String get zipCode => 'Code postal';
}

// Path: exceptions
class _TranslationsExceptionsEn extends TranslationsExceptionsAr {
	_TranslationsExceptionsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsExceptionsUnknownEn unknown = _TranslationsExceptionsUnknownEn._(_root);
	@override late final _TranslationsExceptionsNetworkEn network = _TranslationsExceptionsNetworkEn._(_root);
	@override late final _TranslationsExceptionsServerEn server = _TranslationsExceptionsServerEn._(_root);
	@override late final _TranslationsExceptionsTimeoutEn timeout = _TranslationsExceptionsTimeoutEn._(_root);
	@override late final _TranslationsExceptionsCustomEn custom = _TranslationsExceptionsCustomEn._(_root);
	@override late final _TranslationsExceptionsAppointmentNotInProgressEn appointmentNotInProgress = _TranslationsExceptionsAppointmentNotInProgressEn._(_root);
	@override late final _TranslationsExceptionsPaymentFailedEn paymentFailed = _TranslationsExceptionsPaymentFailedEn._(_root);
	@override late final _TranslationsExceptionsPermissionDeniedEn permissionDenied = _TranslationsExceptionsPermissionDeniedEn._(_root);
	@override late final _TranslationsExceptionsMaintenanceEn maintenance = _TranslationsExceptionsMaintenanceEn._(_root);
}

// Path: date
class _TranslationsDateEn extends TranslationsDateAr {
	_TranslationsDateEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get today => 'Aujourd\'hui';
	@override String get yesterday => 'Hier';
	@override String get tomorrow => 'Demain';
	@override String get beforeYesterday => 'Avant-hier';
}

// Path: exceptions.unknown
class _TranslationsExceptionsUnknownEn extends TranslationsExceptionsUnknownAr {
	_TranslationsExceptionsUnknownEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Erreur';
	@override String get message => 'Une erreur s\'est produite';
}

// Path: exceptions.network
class _TranslationsExceptionsNetworkEn extends TranslationsExceptionsNetworkAr {
	_TranslationsExceptionsNetworkEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Problème réseau';
	@override String get message => 'Veuillez vérifier votre connexion Internet';
}

// Path: exceptions.server
class _TranslationsExceptionsServerEn extends TranslationsExceptionsServerAr {
	_TranslationsExceptionsServerEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Erreur';
	@override String get message => 'Veuillez réessayer plus tard';
}

// Path: exceptions.timeout
class _TranslationsExceptionsTimeoutEn extends TranslationsExceptionsTimeoutAr {
	_TranslationsExceptionsTimeoutEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Erreur';
	@override String get message => 'Une erreur s\'est produite. Veuillez réessayer plus tard';
}

// Path: exceptions.custom
class _TranslationsExceptionsCustomEn extends TranslationsExceptionsCustomAr {
	_TranslationsExceptionsCustomEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Erreur';
	@override String get message => 'Une erreur s\'est produite';
}

// Path: exceptions.appointmentNotInProgress
class _TranslationsExceptionsAppointmentNotInProgressEn extends TranslationsExceptionsAppointmentNotInProgressAr {
	_TranslationsExceptionsAppointmentNotInProgressEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Appel vidéo non disponible';
	@override String get message => 'Ce rendez-vous n\'est pas en cours actuellement. Vous ne pouvez rejoindre l\'appel vidéo que pendant l\'heure du rendez-vous prévu. Veuillez vérifier les détails de votre rendez-vous et réessayer au bon moment.';
}

// Path: exceptions.paymentFailed
class _TranslationsExceptionsPaymentFailedEn extends TranslationsExceptionsPaymentFailedAr {
	_TranslationsExceptionsPaymentFailedEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Échec du paiement';
	@override String get message => 'Le paiement a échoué. Veuillez réessayer plus tard';
}

// Path: exceptions.permissionDenied
class _TranslationsExceptionsPermissionDeniedEn extends TranslationsExceptionsPermissionDeniedAr {
	_TranslationsExceptionsPermissionDeniedEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Permission refusée';
	@override String get message => 'Accès refusé. Vous n\'avez pas la permission d\'effectuer cette action.';
}

// Path: exceptions.maintenance
class _TranslationsExceptionsMaintenanceEn extends TranslationsExceptionsMaintenanceAr {
	_TranslationsExceptionsMaintenanceEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Maintenance';
	@override String get message => 'Le système est actuellement en maintenance. Veuillez réessayer plus tard.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
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
