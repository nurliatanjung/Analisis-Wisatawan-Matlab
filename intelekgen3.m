% Definisikan matriks A
A = [19, 17, 15, 11, 13, 16, 12, 13;
     37, 27, 25, 11, 25, 30, 14, 13;
     9, 10, 10, 6, 11, 11, 9, 5;
     20, 21, 20, 16, 22, 21, 16, 16;
     25, 26, 20, 9, 25, 36, 14, 17];

% Definisikan nilai b untuk setiap kelompok umur
b = [3; 8; 5; 5; 25];  % Kelompok umur: (15-17, 18-25, 26-30, 31-35, 36-60)

% Gunakan repmat untuk menyamakan ukuran b dengan A
b_expanded = repmat(b, 1, size(A, 2));

% Lakukan pembagian elemen-wise
result = A ./ b_expanded;

% Hitung Arithmetic Mean (AM) dan Standard Deviation (SD) untuk setiap kolom
AM = mean(result);
SD = std(result);

% Definisikan array nilai alpha
alpha_values = [0.15, 0.35, 0.45, 0.75];

% Rentang usia dan titik tengah
age_ranges = [15, 17; 18, 25; 26, 30; 31, 35; 36, 60];
age_midpoints = mean(age_ranges, 2); % Titik tengah setiap rentang usia

% Inisialisasi matriks CEAD kumulatif
CEAD = zeros(size(result));

% Membuat figure baru dengan dua subplot
figure;

% Subplot kiri: Grafik RTD untuk setiap alpha
subplot(1, 2, 1);
hold on;

% Warna untuk setiap nilai alpha
cmap = lines(length(alpha_values));

for k = 1:length(alpha_values)
    alpha = alpha_values(k);
    
    % Inisialisasi RAD
    RAD = zeros(size(result));
    
    % Loop per kolom
    for j = 1:size(result, 2)
        for i = 1:size(result, 1)
            lower_bound = AM(j) - alpha * SD(j);
            upper_bound = AM(j) + alpha * SD(j);
            if result(i, j) <= lower_bound
                RAD(i, j) = -1;
            elseif result(i, j) >= upper_bound
                RAD(i, j) = 1;
            else
                RAD(i, j) = 0;
            end
        end
    end
    
    % Hitung RTD
    RTD = sum(RAD, 2);
    
    % Interpolasi data menggunakan spline
    interpolated_age = linspace(min(age_midpoints), max(age_midpoints), 100);
    interpolated_RTD = spline(age_midpoints, RTD, interpolated_age);
    
    % Plot hasil interpolasi
    plot(interpolated_age, interpolated_RTD, '-', 'LineWidth', 1.5, 'Color', cmap(k, :), ...
         'DisplayName', sprintf('\\alpha = %.2f', alpha));
    % Plot titik asli
    plot(age_midpoints, RTD, 'o', 'Color', cmap(k, :), 'MarkerFaceColor', cmap(k, :)); 
    
    % Tambahkan ke matriks CEAD secara kumulatif
    CEAD = CEAD + RAD;
    
    % Tampilkan matriks RAD dan RTD di Command Window
    fprintf('Alpha = %.2f\n', alpha);
    disp('Matriks RAD:');
    disp(RAD);
    disp('Hasil Penjumlahan Baris RTD:');
    disp(RTD);
    disp('-----------------------------');
end

% Menambahkan label, legenda, dan pengaturan grafik
xlabel('Age');
ylabel('RTD (s_i)');
title('RTD for Different Alpha Values');
legend('Location', 'best'); % Menempatkan legenda secara otomatis
grid on;
ylim([-30, 40]); % Batas sumbu y untuk RTD
hold off;

% Subplot kanan: Grafik CEAD kumulatif
subplot(1, 2, 2);
hold on;

% Hitung dan plot cumulative raw RTD dari matriks CEAD
cumulative_raw_RTD = sum(CEAD, 2);
interpolated_CEAD = spline(age_midpoints, cumulative_raw_RTD, interpolated_age);

% Plot interpolasi CEAD
plot(interpolated_age, interpolated_CEAD, '-', 'LineWidth', 2, 'Color', 'b', 'DisplayName', 'Cumulative CEAD');
% Plot titik asli dengan marker tebal
plot(age_midpoints, cumulative_raw_RTD, 'x', 'Color', 'b', 'MarkerSize', 10, 'LineWidth', 2); 

% Menambahkan label, legenda, dan pengaturan grafik
xlabel('Age');
ylabel('Cumulative RTD (s_i)');
title('Cumulative RTD (CEAD)');
legend('Location', 'best'); % Menempatkan legenda secara otomatis
grid on;
ylim([-40, 120]); % Batas sumbu y untuk CEAD
hold off;

% Aktifkan data cursor mode untuk grafik interaktif
datacursormode on;
