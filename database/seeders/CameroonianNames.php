<?php

namespace Database\Seeders;

class CameroonianNames
{
    public static function list(): array
    {
        return [
            'Jean-Paul Mbarga',
            'Marie-Claire Ngo Bakolle',
            'Serge Fotso',
            'Blaise Nkeng',
            'Achille Mballa',
            'Landry Ateba',
            'Ornella Njoya',
            'Sandrine Tchoumi',
            'Yvette Foka',
            'Arsène Ebogo',
            'Brice Kamga',
            'Christelle Talla',
            'Ghislain Ndoumbe',
            'Pélagie Etoundi',
            'Divine Ashu',
            'Precious Bih',
            'Comfort Fru',
            'Ndifor Nfor',
            'Rodrigue Wandji',
            'Carine Nguemo',
            'Franck Essomba',
            'Huguette Abena',
            'Cédric Beyala',
            'Nadège Nkemayang',
            'Aurélie Fomekong',
            'Emmanuel Tabi',
            'Grace Ngwa',
            'Patrick Kum',
            'Vanessa Onana',
            'Hervé Zang',
            'Solange Mbia',
            'Armand Chendjou',
            'Judith Ekwalla',
            'Bertrand Ngoune',
            'Larissa Menye',
            'Fabrice Djoumessi',
            'Rachel Aboubakar',
            'Constant Biya Ntol',
            'Delphine Sanda',
            'Ivan Chamba',
        ];
    }

    public static function random(): string
    {
        $names = self::list();

        return $names[array_rand($names)];
    }

    public static function email(string $name): string
    {
        $domains = ['gmail.com', 'yahoo.fr', 'outlook.com', 'hotmail.com'];
        $slug = strtolower(str_replace(
            ['é', 'è', 'ê', 'à', 'ç', 'î', 'ï', 'ô', ' ', '-', "'"],
            ['e', 'e', 'e', 'a', 'c', 'i', 'i', 'o', '.', '.', ''],
            $name
        ));

        return $slug.random_int(1, 999).'@'.$domains[array_rand($domains)];
    }

    public static function phone(): string
    {
        $secondDigit = [5, 6, 7, 8, 9][array_rand([5, 6, 7, 8, 9])];
        $rest = str_pad((string) random_int(0, 9999999), 7, '0', STR_PAD_LEFT);

        return '+237 6'.$secondDigit.$rest;
    }
}
