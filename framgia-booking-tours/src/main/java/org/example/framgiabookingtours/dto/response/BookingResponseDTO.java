package org.example.framgiabookingtours.dto.response;

import org.example.framgiabookingtours.entity.Booking;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookingResponseDTO {
    private Long id;

    // Thông tin Tour (chỉ lấy tên và ảnh)
    private Long tourId;
    private String tourName;
    private String tourImage;
    private String tourLocation;

    // Thông tin Booking
    private LocalDateTime bookingDate;
    private LocalDate startDate;
    private Integer numPeople;
    private BigDecimal totalPrice;
    private String status;       // Trả về String thay vì Enum để frontend dễ xử lý
    private String paymentMethod;

    // KHÔNG trả về User (vì user đang xem danh sách của chính mình)
    // KHÔNG trả về Password, Role, v.v.

    // Hàm tiện ích để chuyển từ Entity sang DTO
    public static BookingResponseDTO fromEntity(Booking booking) {
        return BookingResponseDTO.builder()
                .id(booking.getId())
                .tourId(booking.getTour().getId())
                .tourName(booking.getTour().getName())
                .tourImage(booking.getTour().getImageUrl()) // Giả sử Tour có trường này
                .tourLocation(booking.getTour().getLocation())
                .bookingDate(booking.getBookingDate())
                .startDate(booking.getStartDate())
                .numPeople(booking.getNumPeople())
                .totalPrice(booking.getTotalPrice())
                .status(booking.getStatus().name())
                .paymentMethod(booking.getPaymentMethod() != null ? booking.getPaymentMethod().name() : null)
                .build();
    }
}

